`timescale 1ns / 1ps
`include "Dflipflop.v"

module controller(
output [1:0]F,  // 2-bits output
input x, y, clk,reset    // clk -> clock
    );

    reg [1:0] present_state = 2'b0;  // initialization of present state with 2'b00 value
    wire [1:0] next_state;          // declaration of next_state

    Dflipflop D2(.Q(next_state[1]),.D(~present_state[1] & present_state[0] | present_state[1] & x),.clk(clk),.rst(reset));
    Dflipflop D1(.Q(next_state[0]),.D(~present_state[1] & ~present_state[0] & x | ~present_state[1] & present_state[0] & y | x & y),.clk(clk),.rst(reset));
    
    always @ (next_state) begin  
    
        present_state <= next_state;  // updating present state 
    end
    assign F = present_state;   //assign output
    
       
endmodule
