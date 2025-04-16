module AND_2(
   input BNE,
    input Zero_I,
    output BNE_OUT

    );
    
    
    assign BNE_OUT = BNE & Zero_I;
endmodule

