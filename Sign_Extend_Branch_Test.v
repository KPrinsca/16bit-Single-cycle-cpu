`timescale 1ns / 1ps

module Sign_Extend_Branch_Test;
    reg [3:0] Branch_Imm;
    wire [15:0] Branch_Out;
    
    Sign_Extend_Branch dut(
        .Branch_Imm(Branch_Imm),
        .Branch_Out(Branch_Out)
    );
    
    initial begin
        $display("\nTesting Sign_Extend_Branch Module:");
        
        // Test 1: Positive Immediate (4'h3 → 16'h0003)
        Branch_Imm = 4'b0011;
        #10;
        if(Branch_Out !== 16'h0003) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        // Test 2: Negative Immediate (4'hC → 16'hFFFC)
        Branch_Imm = 4'b1100;
        #10;
        if(Branch_Out !== 16'hFFFC) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        // Test 3: Zero (4'h0 → 16'h0000)
        Branch_Imm = 4'b0000;
        #10;
        if(Branch_Out !== 16'h0000) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        // Test 4: Max Negative (4'h8 → 16'hFFF8)
        Branch_Imm = 4'b1000;
        #10;
        if(Branch_Out !== 16'hFFF8) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
