module AND_Gate(
    input Branch,
    input Zero_In,
    output Branch_out
    );
    
    assign Branch_out = Branch & Zero_In;
    
endmodule
