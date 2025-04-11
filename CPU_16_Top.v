
module CPU_16_TOP(
       input clk,
       input reset,

      output [15:0]ALU_out,
     output [15:0] Program_cout,DATA_R1, DATA_R2, IM_output,
    output [3:0] ALUop, Rd,
    output ALU_z,Read_Memory,B_int 
    );
    
    wire [15:0] Inst_PC_Out, Write_Mem, ReadData1, ReadData2, ALU_O, PC_Inst, Jump_Inst, Branch_InstB;
    wire [15:0] Inst_IM_out, S_ExtendA_out, Mux_OutA, MemOut, PC2_Insts, JB_Ins, Extend_JOut, Extend_BOut, Jump_Mout, Branch_MOut;
    wire [3:0] Read_Reg1, Read_Reg2, Write_RegA, Opcode, Funct_code;  
    wire RegWrite, ALU_Src,zero_i, MemWrite, MemRead, Mem_Reg, JB_sel, B_inst, Branch_Sel, J_inst;
    wire [3:0] S_ExtendA, ALUcont, B_Extend;
    wire [11:0] Jump_Extend;
    


    
     program_counter program_counter(.clk(clk),.reset(reset),.PC_In(PC_Inst),.PC_output(Inst_PC_Out));
     
     
      Instruction_Memory Instruction_Memory(.Instruct_In(Inst_PC_Out),.Address_Read(Inst_IM_out));
    
    
    assign Read_Reg1 = Inst_IM_out[7:4];
    assign Read_Reg2 = Inst_IM_out[11:8];
    assign Write_RegA = Inst_IM_out[11:8];
    Register_File Register_File(.Read_Reg_Add1(Read_Reg1),.Read_Reg_Add2(Read_Reg2),.Write_Reg(Write_RegA),.Write_Data(Write_Mem),
    .RegWrite(RegWrite), 
    .clk(clk), .Read_Data1(ReadData1), .Read_Data2(ReadData2));
    
    
     assign S_ExtendA = Inst_IM_out[3:0];
     SignExtend_M SignExtend_M(.Imm(S_ExtendA),.Imm_Ex(S_ExtendA_out));
     
     
     ALU_mux ALU_mux(.Reg_Data(ReadData2), .Ext_Imm(S_ExtendA_out),.Mux_Out(Mux_OutA),.ALU_Src(ALU_Src));
    
   
    ALU_Unit ALU_Unit(.ALU_InA(ReadData1),.ALU_InB(Mux_OutA),.ALU_cont(ALUcont),.ALU_output(ALU_O),.ALU_zero(zero_i));
    
    
     Data_Memory Data_Memory(.DMem_In(ALU_O),.Data_Write(ReadData2),.Mem_Write(MemWrite),.Mem_Read(MemRead),.clk(clk),.DataM_out(MemOut));
    
    
    Mem_Mux Mem_Mux(.Mem_Out(MemOut),.ALU_out(ALU_O),.Mem_to_Reg(Mem_Reg),.Mem_Mux_Out(Write_Mem));
    
   
    PC_Mux PC_Mux(.JB_Inst(JB_Ins),.PC2_Inst(PC2_Insts),.JBP_enable(JB_sel),.PC_Mux_Out(PC_Inst));
    
   
    Adder_PC Adder_PC(.PC_out(Inst_PC_Out),.PC_Add_out(PC2_Insts));
    
    
    assign Jump_Extend = Inst_IM_out[11:0];
    Sign_Extend_Jump Sign_Extend_Jump(.J_imm(Jump_Extend),.J_extend(Extend_JOut));
    
    
    assign B_Extend =  Inst_IM_out[3:0];
    Sign_Extend_Branch Sign_Extend_Branch(.Branch_Imm(B_Extend),.Branch_Out(Extend_BOut));
    
   
    Shift_Left_1 Shift_Left_1(.Shift_Jump(Extend_JOut),.Shift_Jump_out(Jump_Inst));
    
    
    Shift_left_branch Shift_left_branch(.Shift_Branch(Extend_BOut),.Shift_Branch_out(Branch_InstB));
    
    
    AND_Gate AND_Gate(.Branch(B_inst), .Zero_In(zero_i), .Branch_out(Branch_Sel));
    
        
    Branch_Mux Branch_Mux(.Branch_Inst(Branch_InstB),.B_Mux_Out(Branch_MOut),.Branch_Sel(Branch_Sel));
    
    
    Jump_Mux Jump_Mux(.Jump_Inst(Jump_Inst),.Branch_Inst(Branch_MOut),.Jump_sel(J_inst),.Jump_Mux_Out(Jump_Mout));
     
     
     Adder_JB Adder_JB(.PC2_out(PC2_Insts),.JB_In(Jump_Mout),.JB_Add_out(JB_Ins));
     
    
     assign Opcode =  Inst_IM_out[15:12];
      assign Funct_code =  Inst_IM_out[3:0];
    Control_Unit Control_Unit(.opcode(Opcode),.Funct_field(Funct_code),.ALU_op(ALUcont),.Mem_Write(MemWrite), .Mem_Read(MemRead),
    .Mem_to_Reg(Mem_Reg),.Reg_Write(RegWrite),.Branch(B_inst),.Jump(J_inst),.ALU_Src(ALU_Src),.Jump_Branch(JB_sel));
   
   

   
   assign ALU_out  = ALU_O;
   assign Program_cout = Inst_PC_Out;
   assign DATA_R1 = ReadData1;
      assign DATA_R2 =ReadData2;
   assign IM_output = Inst_IM_out;
   assign ALUop = ALUcont;
    assign ALU_z = zero_i;
    assign Rd = Write_RegA;
    assign Read_Memory = MemRead;
    assign B_int = B_inst;
endmodule
