`timescale 1ns / 1ps

module ALU_mux_Test;
    reg [15:0] Reg_Data;
    reg [15:0] Ext_Imm;
    reg ALU_Src;
    wire [15:0] Mux_Out;
    
    ALU_mux dut(
        .Reg_Data(Reg_Data),
        .Ext_Imm(Ext_Imm),
        .Mux_Out(Mux_Out),
        .ALU_Src(ALU_Src)
    );
    
    initial begin
        $display("\nTesting ALU_mux Module:");
        
        // Test 1: Select Register
        Reg_Data = 16'h1234; Ext_Imm = 16'h5678; ALU_Src = 0;
        #10;
        if(Mux_Out !== 16'h1234) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        // Test 2: Select Immediate
        ALU_Src = 1;
        #10;
        if(Mux_Out !== 16'h5678) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        // Test 3: 
        Reg_Data = 16'hAAAA; Ext_Imm = 16'hFFFF; ALU_Src = 0;
        #10;
        if(Mux_Out !== 16'hAAAA) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        // Test 4: Dynamic Switching
        ALU_Src = 0; #5;
        ALU_Src = 1; #5;
        if(Mux_Out !== 16'hFFFF) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
