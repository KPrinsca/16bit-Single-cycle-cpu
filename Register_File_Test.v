`timescale 1ns / 1ps

module Register_File_tb;
    reg [3:0] Read_Reg_Add1;
    reg [3:0] Read_Reg_Add2;
    reg [3:0] Write_Reg;
    reg [15:0] Write_Data;
    reg RegWrite;
    reg clk;
    wire [15:0] Read_Data1;
    wire [15:0] Read_Data2;
    
    Register_File dut(
        .Read_Reg_Add1(Read_Reg_Add1),
        .Read_Reg_Add2(Read_Reg_Add2),
        .Write_Reg(Write_Reg),
        .Write_Data(Write_Data),
        .RegWrite(RegWrite),
        .clk(clk),
        .Read_Data1(Read_Data1),
        .Read_Data2(Read_Data2)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        $display("\nTesting Register_File Module:");
        clk = 0;
        
        // Test 1: Write/Read
        Write_Reg = 4'd2; Write_Data = 16'h1234; RegWrite = 1;
        Read_Reg_Add1 = 4'd2; Read_Reg_Add2 = 4'd0;
        #10;
        if(Read_Data1 !== 16'h1234) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
        // Test 2: Multi-Reg
        Write_Reg = 4'd3; Write_Data = 16'h5678; 
        #10;
        Read_Reg_Add1 = 4'd3;
        #10;
        if(Read_Data1 !== 16'h5678) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        // Test 3: Write Disable
        RegWrite = 0; Write_Data = 16'h9ABC;
        #10;
        if(Read_Data1 === 16'h9ABC) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        // Test 4: Dual Read
        Read_Reg_Add1 = 4'd2; Read_Reg_Add2 = 4'd3;
        #10;
        if(Read_Data1 !== 16'h1234 || Read_Data2 !== 16'h5678) $display("Test 4 Failed");
        else $display("Test 4 Passed");
        
        $finish;
    end
endmodule
