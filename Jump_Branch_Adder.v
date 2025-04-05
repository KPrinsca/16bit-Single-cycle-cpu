module Adder_JB(
    input [15:0] PC_out,
    input [15:0] JB_In,
    output [15:0] JB_Add_out
    );
    
     assign JB_Add_out = JB_In + PC_out;
endmodule
