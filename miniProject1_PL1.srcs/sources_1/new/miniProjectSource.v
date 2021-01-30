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
// 
//////////////////////////////////////////////////////////////////////////////////


module miniProjectSource(
    input clock,
    input in0,in1,
    output reg a,b,c,d,e,f,g,h
    
    );
    reg temp = 1'b1;
    reg temp2 = 1'b0;
//always @ (posedge clock)
   // begin
    
    //temp = ~temp;
  //  end
    
always @ (*)
    begin
   
    a <= in0;
    b <= in1;
    c <= temp;
    d <= temp;
    e <= temp;
    f <= temp;
    g <= temp;
    h <= temp;
    end
    
endmodule



