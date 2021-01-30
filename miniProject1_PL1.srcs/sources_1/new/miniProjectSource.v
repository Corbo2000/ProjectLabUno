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
    output reg a,b,c,d,e,f
    
    );
    reg temp = 1'b1;
//always @ (posedge clock)
   // begin
    
    //temp = ~temp;
  //  end
    
always @ (*)
    begin
    a <= temp;
    b <= temp;
    c <= temp;
    d <= temp;
    e <= temp;
    f <= temp;
    end
    
endmodule



