
module CPU_16_test();

   reg clk;
   reg reset;
   wire [15:0]ALU_out, pc_out,DATA_R1,DATA_R2, IM_output;
  wire [3:0] ALUop;
   
 
CPU_16_TOP uut(clk,reset,ALU_out,pc_out,DATA_R1,DATA_R2,IM_output,ALUop);

initial begin
     
        clk = 1;
        reset = 1;
        #5
        reset =0;
        #100;   
    end

    always begin
    #5 clk = ~clk; 
    end


always@(posedge clk) begin
       $display("Time=%0t ALU_Out=%b | DATA_R2=%b | IM_output=%b | ALUop =%b", 
                  $time, ALU_out, DATA_R2,IM_output,ALUop);
             end     




endmodule
