`timescale 1ns / 1ps

module Shift_Left_1_Test;
    reg [15:0] Shift_Jump;
    wire [15:0] Shift_Jump_out;
    
    Shift_Left_1 dut(
        .Shift_Jump(Shift_Jump),
        .Shift_Jump_out(Shift_Jump_out)
    );
    
    initial begin
        $display("\nTesting Shift_Left_1 Module:");

        Shift_Jump = 16'h0001;
        #10;
        if(Shift_Jump_out !== 16'h0002) $display("Test 1 Failed");
        else $display("Test 1 Passed");

        Shift_Jump = 16'h8000;  
        #10;
        if(Shift_Jump_out !== 16'h0000) $display("Test 2 Failed");
        else $display("Test 2 Passed");

        Shift_Jump = 16'hFFFF;  
        #10;
        if(Shift_Jump_out !== 16'hFFFE) $display("Test 3 Failed");
        else $display("Test 3 Passed");

        Shift_Jump = 16'hAAAA;  
        #10;
        if(Shift_Jump_out !== 16'h5554) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
