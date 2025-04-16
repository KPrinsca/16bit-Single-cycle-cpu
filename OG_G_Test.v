`timescale 1ns/1ps
module OR_G_Test;
    reg and_1, and_2;
    wire be_bn_out;

    OR_G uut (.and_1(and_1), .and_2(and_2), .be_bn_out(be_bn_out));

    initial begin
        and_1 = 0; and_2 = 0;
        #10;
        if (be_bn_out != 0) $display("OR_G Test 1: Failed");
        else $display("OR_G Test 1: Passed");

        and_1 = 0; and_2 = 1;
        #10;
        if (be_bn_out != 1) $display("OR_G Test 2: Failed");
        else $display("OR_G Test 2: Passed");

        and_1 = 1; and_2 = 0;
        #10;
        if (be_bn_out != 1) $display("OR_G Test 3: Failed");
        else $display("OR_G Test 3: Passed");

        and_1 = 1; and_2 = 1;
        #10;
        if (be_bn_out != 1) $display("OR_G Test 4: Failed");
        else $display("OR_G Test 4: Passed");
    end
endmodule
