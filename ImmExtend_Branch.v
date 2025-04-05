module Sign_Extend_Branch(
    input [3:0] Branch_Imm,
    output [15:0] Branch_Out
    );
    
    assign Branch_Out = {{12{Branch_Imm[3]}}, Branch_Imm};
    
endmodule
