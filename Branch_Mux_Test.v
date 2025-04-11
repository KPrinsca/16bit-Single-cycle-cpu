`timescale 1ns / 1ps

module Branch_Mux_Test;
    reg [15:0] Branch_Inst;
    reg Branch_Sel;
    wire [15:0] B_Mux_Out;
    
    Branch_Mux dut(
        .Branch_Inst(Branch_Inst),
        .B_Mux_Out(B_Mux_Out),
        .Branch_Sel(Branch_Sel)
    );
    
    initial begin
        $display("\nTesting Branch_Mux:");
        
        
        Branch_Inst = 16'h1234; Branch_Sel = 0;
        #10;
        if(B_Mux_Out !== 16'h0000) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        
        Branch_Sel = 1;
        #10;
        if(B_Mux_Out !== 16'h1234) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        
        Branch_Inst = 16'hFFFF; Branch_Sel = 1;
        #10;
        if(B_Mux_Out !== 16'hFFFF) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        $finish;
    end
endmodule
