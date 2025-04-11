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
 
        Branch_Imm = 4'b0011;
        #10;
        if(Branch_Out !== 16'h0003) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        Branch_Imm = 4'b1100;
        #10;
        if(Branch_Out !== 16'hFFFC) $display("Test 2 Failed");
        else $display("Test 2 Passed");

        Branch_Imm = 4'b0000;
        #10;
        if(Branch_Out !== 16'h0000) $display("Test 3 Failed");
        else $display("Test 3 Passed");

        Branch_Imm = 4'b1000;
        #10;
        if(Branch_Out !== 16'hFFF8) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
