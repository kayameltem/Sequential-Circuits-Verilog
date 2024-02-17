`timescale 1ns / 1ps
`include "controller.v"

module controller_tb;

    reg x,y,clk,rst;  // x,y -> inputs , clk -> clock, rst -> reset 
    wire [1:0]F_tb;    // 2-bits output
    
   controller UUT(.F(F_tb),.x(x),.y(y),.clk(clk),.reset(rst));   //unit under test
    
    initial begin
        rst = 1'b1;     //initialization reset
        clk = 1'b0;    //initialization clock
        #50 rst= 1'b0;   //set reset to 0
        #550 $finish;    
    end
    
        always #25 clk = ~clk;   //clock generator. period of clock is 50

    always begin
        #50 {x,y} = 2'b10;     //test inputs.
        #50 {x,y} = 2'b01;
        #50 {x,y} = 2'b10;
        #50 {x,y} = 2'b11;
        #50 {x,y} = 2'b11;
        #50 {x,y} = 2'b01;
        #50 {x,y} = 2'b00;
        #50 {x,y} = 2'b10;
        #50 {x,y} = 2'b10;
        #50 {x,y} = 2'b10;
        #50 {x,y} = 2'b00;             
        end   
endmodule
