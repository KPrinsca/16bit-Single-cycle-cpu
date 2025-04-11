module Shift_Left_1(
    input [15:0] Shift_Jump,
    output [15:0] Shift_Jump_out
    );
    
    assign Shift_Jump_out = Shift_Jump << 1; 
endmodule
