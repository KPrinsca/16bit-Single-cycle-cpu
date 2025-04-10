`timescale 1ns / 1ps

module program_counter_Test;
    reg clk;
    reg reset;
    reg [15:0] PC_In;
    wire [15:0] PC_output;
    
    program_counter dut(
        .clk(clk),
        .reset(reset),
        .PC_In(PC_In),
        .PC_output(PC_output)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        $display("\nTesting program_counter:");
        clk = 0;
        reset = 1;
        
        // Test 1: Reset
        #10;
        if(PC_output !== 0) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        // Test 2: Normal Operation
        reset = 0; PC_In = 16'h1234;
        #10;
        if(PC_output !== 16'h1234) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        // Test 3: New Input
        PC_In = 16'h5678;
        #10;
        if(PC_output !== 16'h5678) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        // Test 4: Async Reset
        reset = 1; PC_In = 16'h9ABC;
        #10;
        if(PC_output !== 0) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
