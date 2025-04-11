`timescale 1ns / 1ps

module Adder_JB_Test;
    reg [15:0] PC_out;
    reg [15:0] JB_In;
    wire [15:0] JB_Add_out;
    
    Adder_JB dut(
        .PC_out(PC_out),
        .JB_In(JB_In),
        .JB_Add_out(JB_Add_out)
    );
    
    initial begin
        $display("\nTesting Adder_JB Module:");
        
        
        PC_out = 16'h0002; JB_In = 16'h0004;
        #10;
        if(JB_Add_out !== 16'h0006) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        
        PC_out = 16'hFFFE; JB_In = 16'hFFFF;
        #10;
        if(JB_Add_out !== 16'hFFFD) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        
        PC_out = 16'hFFFF; JB_In = 16'h0001;
        #10;
        if(JB_Add_out !== 16'h0000) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        
        PC_out = 16'h0000; JB_In = 16'h0000;
        #10;
        if(JB_Add_out !== 16'h0000) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
