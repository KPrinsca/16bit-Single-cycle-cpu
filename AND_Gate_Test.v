`timescale 1ns / 1ps

module AND_Gate_Test;
    reg Branch;
    reg Zero_In;
    wire Branch_out;
    
    AND_Gate dut(
        .Branch(Branch),
        .Zero_In(Zero_In),
        .Branch_out(Branch_out)
    );
    
    initial begin
        $display("\nTesting AND_Gate:");
        
        
        Branch = 1; Zero_In = 1;
        #10;
        if(Branch_out !== 1) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        
        Branch = 0; Zero_In = 1;
        #10;
        if(Branch_out !== 0) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        
        Branch = 1; Zero_In = 0;
        #10;
        if(Branch_out !== 0) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        
        Branch = 0; Zero_In = 0;
        #10;
        if(Branch_out !== 0) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
