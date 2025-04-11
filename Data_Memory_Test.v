`timescale 1ns / 1ps

module Data_Memory_Test;
    reg [15:0] DMem_In;
    reg [15:0] Data_Write;
    reg Mem_Write, Mem_Read, clk;
    wire [15:0] DataM_out;
    
    Data_Memory dut(
        .DMem_In(DMem_In),
        .Data_Write(Data_Write),
        .Mem_Write(Mem_Write),
        .Mem_Read(Mem_Read),
        .clk(clk),
        .DataM_out(DataM_out)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        $display("\nTesting Data_Memory Module:");
        clk = 0;
        
        
        DMem_In = 16'h0004; Data_Write = 16'hABCD; Mem_Write = 1; Mem_Read = 0;
        #10;
        
        
        Mem_Write = 0; Mem_Read = 1;
        #10;
        if(DataM_out !== 16'hABCD) $display("Test 1 Failed");
        else $display("Test 1 Passed");
        
      
        DMem_In = 16'h00FE; Data_Write = 16'h1234; Mem_Write = 1; Mem_Read = 0;
        #10;
        Mem_Write = 0; Mem_Read = 1;
        #10;
        if(DataM_out !== 16'h1234) $display("Test 2 Failed");
        else $display("Test 2 Passed");
        
        
        DMem_In = 16'h0006; Data_Write = 16'h5678; Mem_Write = 1; Mem_Read = 1;
        #10;
        if(DataM_out !== 16'h5678) $display("Test 3 Failed");
        else $display("Test 3 Passed");
        
        $finish;
    end
endmodule
