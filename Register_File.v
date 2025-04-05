

module Register_File(
    input [3:0] Read_Reg_Add1,//rs
    input [3:0] Read_Reg_Add2,//rt/rd
  input [3:0] Write_Reg,//rt/rd
    input [15:0] Write_Data,
    input RegWrite,
    input clk,
    output [15:0] Read_Data1,
    output [15:0] Read_Data2
    );
    
     reg [15:0] Registers [15:0];



integer i;

   initial begin
        for (i = 0; i < 16; i = i + 1)
          Registers[i] = 16'b0000000000000000;
   
	end

   assign  Read_Data1 = Registers[Read_Reg_Add1];
   assign Read_Data2 = Registers[Read_Reg_Add2];
	
	
	always @(posedge clk)
   begin
        if (RegWrite) begin
            Registers[Write_Reg] <= Write_Data;
            end
 
     end  
