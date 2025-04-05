
module Adder_PC(
    input [15:0] PC_out,
    output [15:0] PC_Add_out
    );
    
     assign PC_Add_out = PC_out + 16'b0000000000000010;
    
endmodule
