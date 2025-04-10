

`timescale 1ns / 1ps

module PC_Mux_Test;
    reg [15:0] JB_Inst;
    reg [15:0] PC2_Inst;
    reg JBP_enable;
    wire [15:0] PC_Mux_Out;
    
    PC_Mux dut(
        .JB_Inst(JB_Inst),
        .PC2_Inst(PC2_Inst),
        .JBP_enable(JBP_enable),
        .PC_Mux_Out(PC_Mux_Out)
    );
    
    initial begin
        $display("\nTesting PC_Mux:");
        
        // Test 1: Normal PC Increment
        JB_Inst = 16'h1234; PC2_Inst = 16'h5678; JBP_enable = 0;
        #10;
        if(PC_Mux_Out !== 16'h5678) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        // Test 2: Jump/Branch Path
        JBP_enable = 1;
        #10;
        if(PC_Mux_Out !== 16'h1234) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        // Test 3: Boundary Values
        JB_Inst = 16'hFFFF; PC2_Inst = 16'h0000; JBP_enable = 1;
        #10;
        if(PC_Mux_Out !== 16'hFFFF) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        // Test 4: Transition Check
        JBP_enable = 0; #5;
        JBP_enable = 1; #5;
        if(PC_Mux_Out !== 16'hFFFF) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
