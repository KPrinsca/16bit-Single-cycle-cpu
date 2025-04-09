`timescale 1ns / 1ps

module SignExtend_M_tb;
    reg [3:0] Imm;
    wire [15:0] Imm_Ex;
    
    SignExtend_M dut(
        .Imm(Imm),
        .Imm_Ex(Imm_Ex)
    );
    
    initial begin
        $display("\nTesting SignExtend_M:");
        
        // Test 1: Positive Number
        Imm = 4'b0011;
        #10;
        if(Imm_Ex !== 16'h0003) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        // Test 2: Negative Number
        Imm = 4'b1100;
        #10;
        if(Imm_Ex !== 16'hFFFC) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        // Test 3: Zero Extension
        Imm = 4'b0000;
        #10;
        if(Imm_Ex !== 16'h0000) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        // Test 4: Max Positive
        Imm = 4'b0111;
        #10;
        if(Imm_Ex !== 16'h0007) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
