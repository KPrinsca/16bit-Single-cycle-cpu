`timescale 1ns / 1ps

module Mem_Mux_Test;
    reg [15:0] Mem_Out;
    reg [15:0] ALU_out;
    reg Mem_to_Reg;
    wire [15:0] Mem_Mux_Out;
    
    Mem_Mux dut(
        .Mem_Out(Mem_Out),
        .ALU_out(ALU_out),
        .Mem_to_Reg(Mem_to_Reg),
        .Mem_Mux_Out(Mem_Mux_Out)
    );
    
    initial begin
        $display("\nTesting Mem_Mux:");
        
        Mem_Out = 16'h1234; ALU_out = 16'h5678; Mem_to_Reg = 0;
        #10;
        if(Mem_Mux_Out !== 16'h5678) $display("Test 1 Failed");
        else $display("Test 1 Passed");

        Mem_to_Reg = 1;
        #10;
        if(Mem_Mux_Out !== 16'h1234) $display("Test 2 Failed");
        else $display("Test 2 Passed");

        Mem_Out = 16'hFFFF; ALU_out = 16'h8000; Mem_to_Reg = 0;
        #10;
        if(Mem_Mux_Out !== 16'h8000) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        
        $finish;
    end
endmodule
