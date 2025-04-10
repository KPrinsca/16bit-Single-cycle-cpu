`timescale 1ns / 1ps

module Instruction_Memory_Test;
    reg [15:0] Instruct_In;
    wire [15:0] Address_Read;
    
    Instruction_Memory dut(
        .Instruct_In(Instruct_In),
        .Address_Read(Address_Read)
    );
    
    initial begin
        $display("\nTesting Instruction_Memory Module:");
        
        // Test 1: Address 0 (First Instruction)
        Instruct_In = 16'h0000;
        #10;
        // Expected: Memory[0] = 8'h31, Memory[1] = 8'h12 → 16'h3112
        if(Address_Read !== 16'h3112) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        // Test 2: Address 2 (Second Instruction)
        Instruct_In = 16'h0002;
        #10;
        // Expected: Memory[2] = 8'h34, Memory[3] = 8'h13 → 16'h3413
        if(Address_Read !== 16'h3413) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        // Test 3: Address 4 (Third Instruction)
        Instruct_In = 16'h0004;
        #10;
        // Expected: Memory[4] = 8'h01, Memory[5] = 8'h40 → 16'h0140
        if(Address_Read !== 16'h0140) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        // Test 4: Address 6 (Fourth Instruction)
        Instruct_In = 16'h0006;
        #10;
        // Expected: Memory[6] = 8'h02, Memory[7] = 8'h41 → 16'h0241
        if(Address_Read !== 16'h0241) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
