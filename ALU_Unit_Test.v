`timescale 1ns / 1ps

module ALU_Unit_Test;
    reg [15:0] ALU_InA;
    reg [15:0] ALU_InB;
    reg [3:0] ALU_cont;
    wire [15:0] ALU_output;
    wire ALU_zero;
    
    ALU_Unit dut(
        .ALU_InA(ALU_InA),
        .ALU_InB(ALU_InB),
        .ALU_cont(ALU_cont),
        .ALU_output(ALU_output),
        .ALU_zero(ALU_zero)
    );
    
    initial begin
        $display("\nTesting ALU_Unit Module:");
        
        // Test 1: ADD
        ALU_cont = 4'b0000; ALU_InA = 16'd5; ALU_InB = 16'd3;
        #10;
        if(ALU_output !== 16'd8 || ALU_zero !== 0) $display("ADD Test Failed");
        else $display("ADD Test Passed");
        
        // Test 2: SUB
        ALU_cont = 4'b0001; ALU_InA = 16'd5; ALU_InB = 16'd3;
        #10;
        if(ALU_output !== 16'd2 || ALU_zero !== 0) $display("SUB Test Failed");
        else $display("SUB Test Passed");
        
        // Test 3: Shift Left
        ALU_cont = 4'b0010; ALU_InA = 16'd3; ALU_InB = 16'h000F;
        #10;
        if(ALU_output !== 16'h0078 || ALU_zero !== 0) $display("SLL Test Failed");
        else $display("SLL Test Passed");
        
        // Test 4: AND
        ALU_cont = 4'b0011; ALU_InA = 16'hAAAA; ALU_InB = 16'h5555;
        #10;
        if(ALU_output !== 16'h0000 || ALU_zero !== 1) $display("AND Test Failed");
        else $display("AND Test Passed");
        
        $finish;
    end
endmodule
