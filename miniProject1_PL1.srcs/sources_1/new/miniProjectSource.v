`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2021 03:56:48 PM
// Design Name: 
// Module Name: miniProjectSource
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Switch 0 : Speed Control 0 25%
// Switch 1 : Speed Control 1 25%
// Switch 2 : Speed Control 2 25%
// Switch 3 : Speed Control 3 25%
// Switch 4 : Left Motor Forward/Backward
// Switch 5 : Right Motor Forward/Backward
// Switch 6 : Left motor on
// Switch 7 : Right motor on
// 7 seg display: 
//////////////////////////////////////////////////////////////////////////////////

//Period 60Hz
module miniProjectSource(
    input clock,
    input in0,in1,in2,in3,in4,in5,in6,in7,
    output PWM,
    input wire control1,control2,
    output reg a,b,c,d,e,f,
    output s0,s1,s2,s3,s4,s5,s6,dp,
    output [3:0] an
    );
    
    localparam N = 18;
    
    
    reg temp = 1;
    reg temp2 = 0;
    
    //100000000/60 = 1666666.667
    //log    (1666666.67) = 20.6 round up to 21
    //   (2)
    reg [21:0] counter;
    reg [21:0] width;
    //reg [27:0] safety_count;
    reg temp_PWM;
    reg temp_curr;
    integer speed;
    reg [7:0]sseg;
    integer safety;
    
    initial begin
    safety = 1;
    counter = 0;
    width = 0;
    temp_PWM = 0;
    //safety_count = 0;
    end
    
    
    
    
    
    always@(posedge clock) begin
        
        if (counter > 1666666)
            counter <= 0;
        else if (safety == 1)
            counter <= counter +1;
        
        /*if(safety == 0)
            temp_PWM <= 0;
        else if(counter < width)
            temp_PWM <= 1;
        else
            temp_PWM <= 0;*/ 
        
            
        if(counter < width)
           temp_PWM <= 1;
        else 
           temp_PWM <= 0;   
              
        if (count > 1666666)
            count <= 0;
        else
            count <= count + 1;
            
        /*if (safety_count > 100000000)
            begin
            safety_count <= 0;
            safety = 1;
            end  
        else if (safety == 0)
            safety_count <= safety_count + 1;*/
            
    end
    
    reg [N-1:0] count;
    reg [6:0] sseg_temp;    
    reg [3:0] an_temp;
always @ (*)
begin
    if (control1 || control2) begin
    safety = 0;
    end
    else begin 
    safety = 1;
    end
 
  case(count[N-1:N-2]) //using only the 2 MSB's of the counter 
   2'b00 :  //When the 2 MSB's are 00 enable the fourth display
    begin
        if (safety == 0) begin
            sseg = 10;
            end
        else begin
            sseg = 5;
            //safety = 1;
            end         
     an_temp = 4'b1110;
    end
   
   2'b01:  //When the 2 MSB's are 01 enable the third display
    begin
        if (safety == 0) begin
            sseg = 1;
            end
        else begin
            sseg = 5;           
            end
     an_temp = 4'b1101;
    end
   
   2'b10:  //When the 2 MSB's are 10 enable the second display
    begin
     sseg = 0;
     an_temp = 4'b1011;
    end
    
   2'b11:  //When the 2 MSB's are 11 enable the first display
    begin
      sseg = 0;    
     an_temp = 4'b0111;
    end
  endcase
 end
assign an = an_temp;

always @ (*)
 begin
  case(sseg)
   4'd0 : sseg_temp = 7'b1000000; //to display 0
   4'd1 : sseg_temp = 7'b1111001; //to display 1
   4'd2 : sseg_temp = 7'b0100100; //to display 2
   4'd3 : sseg_temp = 7'b0110000; //to display 3
   4'd4 : sseg_temp = 7'b0011001; //to display 4
   4'd5 : sseg_temp = 7'b0010010; //to display 5
   4'd6 : sseg_temp = 7'b0000010; //to display 6
   4'd7 : sseg_temp = 7'b1111000; //to display 7
   4'd8 : sseg_temp = 7'b0000000; //to display 8
   4'd9 : sseg_temp = 7'b0010000; //to display 9
   4'd10 : sseg_temp = 7'b0001000; //to display A
   default : sseg_temp = 7'b1111111; //dash
  endcase
 end
assign {s6, s5, s4, s3, s2, s1, s0} = sseg_temp;


    // 100% duty cycle is 1666666.67
    //  75% duty cycle is 1250000
    //  50% duty cycle is 833333.33
    //  25% duty cycle is 416666.67 
    always @ (*)
    begin
    speed = (in0 + in1 + in2 + in3);
    
    case (speed)
    1 : width = 416666;     
    2 : width = 833333;
    3 : width = 1250000;
    4 : width = 1666666;
    default : width = 0;    
    endcase
    
    if(in4) begin
        a = temp;
        b = temp2;
        end
    else begin
        a = temp2;
        b = temp;
        end
    if(in5) begin
        c = temp;
        d = temp2;
        end
    else begin
        c = temp2;
        d = temp;
        end  
        
    if (in6 && safety == 1) begin
        e = temp_PWM;
        end
    else begin
        e = temp2;
        end
        
    if (in7 && safety == 1) begin
        f = temp_PWM;
        end
    else begin
        f = temp2;
        end
        
    //if (safety == 0) 
        
    end
   
assign PWM = temp_PWM;

/*
always@(*)begin
    
    if(safety == 0)begin
        e = temp2;
        f = temp2;
        #1000000000;
        safety = 1;
        end
    end
*/
endmodule
