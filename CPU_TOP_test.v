
module CPU_16_test();

   reg clk;
   reg reset;
   wire [15:0]ALU_out, Program_cout,DATA_R1,DATA_R2, IM_output;
  wire [3:0] ALUop,Rd;
  wire ALU_z,Read_Memory,B_int;
   
 
CPU_16_TOP uut(clk,reset,ALU_out,Program_cout,DATA_R1,DATA_R2,IM_output,ALUop,Rd,ALU_z,Read_Memory,B_int);

initial begin
        // Initialize Signals
        clk = 1;
        reset = 1;
        #5
        reset =0;
        #500;  
    end

 // Generate Clock Signal (50% Duty Cycle)
 always begin
    #5 clk = ~clk; // 10ns period (100MHz CPU)
    end




   always@(negedge clk) begin
       $display("Time=%0t ALU_Out=%b | DATA_R2=%b | IM_output=%b | ALUop =%b|ALU_zero=%b", 
                  $time, ALU_out, DATA_R2,IM_output,ALUop,ALU_z);
             end     




endmodule
