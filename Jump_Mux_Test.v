`timescale 1ns / 1ps

module Jump_Mux_Test;
    reg [15:0] Jump_Inst;
    reg [15:0] Branch_Inst;
    reg Jump_sel;
    wire [15:0] Jump_Mux_Out;
    
    Jump_Mux dut(
        .Jump_Inst(Jump_Inst),
        .Branch_Inst(Branch_Inst),
        .Jump_sel(Jump_sel),
        .Jump_Mux_Out(Jump_Mux_Out)
    );
    
    initial begin
        $display("\nTesting Jump_Mux:");

        Jump_Inst = 16'hAAAA; Branch_Inst = 16'h5555; Jump_sel = 0;
        #10;
        if(Jump_Mux_Out !== 16'h5555) $display("Test 1 Failed");
        else $display("Test 1 Passed");

        Jump_sel = 1;
        #10;
        if(Jump_Mux_Out !== 16'hAAAA) $display("Test 2 Failed");
        else $display("Test 2 Passed");

        Jump_Inst = 16'h1234; Branch_Inst = 16'h5678; Jump_sel = 0;
        #10;
        if(Jump_Mux_Out !== 16'h5678) $display("Test 3 Failed");
        else $display("Test 3 Passed");
 
        Jump_Inst = 16'h0000; Branch_Inst = 16'h0000; Jump_sel = 1;
        #10;
        if(Jump_Mux_Out !== 16'h0000) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
