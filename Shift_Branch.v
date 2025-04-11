module Shift_left_branch(
    input [15:0] Shift_Branch,
    output [15:0] Shift_Branch_out
    );
    
    assign Shift_Branch_out = Shift_Branch << 1;
    
endmodule
