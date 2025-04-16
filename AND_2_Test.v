`timescale 1ns/1ps
module AND_2_Test;
    reg BNE, Zero_I;
    wire BNE_OUT;

    AND_2 uut (.BNE(BNE), .Zero_I(Zero_I), .BNE_OUT(BNE_OUT));

    initial begin
        BNE = 0; Zero_I = 0;
        #10;
        if (BNE_OUT != 0) $display("AND_2 Test 1: Failed");
        else $display("AND_2 Test 1: Passed");

        BNE = 0; Zero_I = 1;
        #10;
        if (BNE_OUT != 0) $display("AND_2 Test 2: Failed");
        else $display("AND_2 Test 2: Passed");

        BNE = 1; Zero_I = 0;
        #10;
        if (BNE_OUT != 0) $display("AND_2 Test 3: Failed");
        else $display("AND_2 Test 3: Passed");

        BNE = 1; Zero_I = 1;
        #10;
        if (BNE_OUT != 1) $display("AND_2 Test 4: Failed");
        else $display("AND_2 Test 4: Passed");
    end
endmodule
