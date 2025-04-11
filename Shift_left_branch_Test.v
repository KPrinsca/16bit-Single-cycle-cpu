`timescale 1ns / 1ps

module Shift_left_branch_Test;
    reg [15:0] Shift_Branch;
    wire [15:0] Shift_Branch_out;
    
    Shift_left_branch dut(
        .Shift_Branch(Shift_Branch),
        .Shift_Branch_out(Shift_Branch_out)
    );
    
    initial begin
        $display("\nTesting Shift_left_branch:");

        Shift_Branch = 16'h0001;
        #10;
        if(Shift_Branch_out !== 16'h0002) $display("Test 1 Failed");
        else $display("Test 1 Passed");

        Shift_Branch = 16'h8000;
        #10;
        if(Shift_Branch_out !== 16'h0000) $display("Test 2 Failed");
        else $display("Test 2 Passed");

        Shift_Branch = 16'hFFFF;
        #10;
        if(Shift_Branch_out !== 16'hFFFE) $display("Test 3 Failed");
        else $display("Test 3 Passed");

        Shift_Branch = 16'h0000;
        #10;
        if(Shift_Branch_out !== 16'h0000) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
