`timescale 1ns/1ps
module NOT_G_Test;
    reg n_zero;
    wire and_in;

    NOT_G uut (.n_zero(n_zero), .and_in(and_in));

    initial begin
        n_zero = 0;
        #10;
        if (and_in != 1) $display("NOT_G Test 1: Failed");
        else $display("NOT_G Test 1: Passed");

        n_zero = 1;
        #10;
        if (and_in != 0) $display("NOT_G Test 2: Failed");
        else $display("NOT_G Test 2: Passed");
    end
endmodule
