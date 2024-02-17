`timescale 1ns / 1ps

module Dflipflop(
output reg Q,
input D,   
input clk,rst // clk -> clock, rst -> reset
    );
    always @(posedge clk,posedge rst) begin
    
        if (rst) 
            Q <= 1'b0;  //if reset is 1, assign output to 0

        else 
           Q <= D; //non-blocking assign statement, assign output to D
    end
endmodule
