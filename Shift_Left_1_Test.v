`timescale 1ns / 1ps

module Shift_Left_1_Test;
    reg [15:0] Shift_Jump;
    wire [15:0] Shift_Jump_out;
    
    Shift_Left_1 dut(
        .Shift_Jump(Shift_Jump),
        .Shift_Jump_out(Shift_Jump_out)
    );
    
    initial begin
        $display("\nTesting Shift_Left_1 Module:");
        
        // Test 1: Basic Shift
        Shift_Jump = 16'h0001;
        #10;
        if(Shift_Jump_out !== 16'h0002) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        // Test 2: Negative Number
        Shift_Jump = 16'h8000;  // -32768 in 2's complement
        #10;
        if(Shift_Jump_out !== 16'h0000) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        // Test 3: Carry Out
        Shift_Jump = 16'hFFFF;  // -1 in 2's complement
        #10;
        if(Shift_Jump_out !== 16'hFFFE) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        // Test 4: Full Shift
        Shift_Jump = 16'hAAAA;  // 1010101010101010
        #10;
        if(Shift_Jump_out !== 16'h5554) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
