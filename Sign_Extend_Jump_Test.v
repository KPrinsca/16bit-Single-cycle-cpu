`timescale 1ns / 1ps

module Sign_Extend_Jump_Test;
    reg [11:0] J_imm;
    wire [15:0] J_extend;
    
    Sign_Extend_Jump dut(
        .J_imm(J_imm),
        .J_extend(J_extend)
    );
    
    initial begin
        $display("\nTesting Sign_Extend_Jump Module:");
        
        J_imm = 12'b0000_0101_1010;  
        #10;
        if(J_extend !== 16'h005A) $display("Test 1 Failed");
        else $display("Test 1 Passed");

        J_imm = 12'b1000_0000_0000; 
        #10;
        if(J_extend !== 16'hF800) $display("Test 2 Failed");
        else $display("Test 2 Passed");

        J_imm = 12'b0000_0000_0000;
        #10;
        if(J_extend !== 16'h0000) $display("Test 3 Failed");
        else $display("Test 3 Passed");

        J_imm = 12'b0111_1111_1111; 
        #10;
        if(J_extend !== 16'h07FF) $display("Test 4a Failed");
        else $display("Test 4a Passed");
        
        J_imm = 12'b1111_1111_1111; 
        #10;
        if(J_extend !== 16'hFFFF) $display("Test 4b Failed");
        else $display("Test 4b Passed");
        
        $finish;
    end
endmodule
