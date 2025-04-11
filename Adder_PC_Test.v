`timescale 1ns / 1ps

module Adder_PC_Test;
    reg [15:0] PC_out;
    wire [15:0] PC_Add_out;
    
    
    Adder_PC dut(
        .PC_out(PC_out),
        .PC_Add_out(PC_Add_out)
    );
    
    initial begin
        $display("\nTesting Adder_PC Module:");
        
        
        PC_out = 16'h0000;
        #10;
        if(PC_Add_out !== 16'h0002) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        
        PC_out = 16'h1234;
        #10;
        if(PC_Add_out !== 16'h1236) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        
        PC_out = 16'hFFFE;  
        #10;
        if(PC_Add_out !== 16'h0000) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        
        PC_out = 16'hFFFF;
        #10;
        if(PC_Add_out !== 16'h0001) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
