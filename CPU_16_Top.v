

module CPU_16_TOP(
       input clk,
       input reset,
      output [15:0] ALU_out,
     output [15:0] pc_out,DATA_R1, DATA_R2, IM_output,
    output [3:0] ALUop
    );
    
    wire [15:0] Inst_PC_Out, Write_Mem, Read_Data1, Read_Data2, ALU_Output, PC_Inst, Jump_Inst, Branch_InstB;
    wire [15:0] Inst_IM_out, S_ExtendA_out, Mux_OutA, Mem_Out, PC2_Insts, JB_Ins, Extend_JOut, Extend_BOut, Jump_Mout, Branch_MOut;
    wire [3:0] Read_Reg1, Read_Reg2, Write_RegA, Opcode, Funct_code;  //1-rs || 2-rt/rd || 3-rt/rd
    wire Reg_Write, ALU_Src, ALU_Zero, Mem_Write, Mem_Read, Mem_To_Reg, JB_sel, Branch, Branch_Sel, Jump;
    wire [3:0] S_ExtendA, ALU_cont, B_Extend;
    wire [12:0] J_Extend;
    


    //Program Counter
     program_counter program_counter(.clk(clk),.reset(reset),.PC_In(PC_Inst),.PC_output(Inst_PC_Out));
     
     //Instruction Memory
      Instruction_Memory Instruction_Memory(.Instruct_In(Inst_PC_Out),.Address_Read(Inst_IM_out));
    
    //Register File
    assign Read_Reg1 = Inst_IM_out[7:4];
    assign Read_Reg2 = Inst_IM_out[11:8];
    assign Write_RegA = Inst_IM_out[11:8];
    Register_File Register_File(.Read_Reg_Add1(Read_Reg1),.Read_Reg_Add2(Read_Reg2),.Write_Reg(Write_RegA),.Write_Data(Write_Mem),
    .RegWrite(Reg_Write), 
    .clk(clk), .Read_Data1(Read_Data1), .Read_Data2(Read_Data2));
    
    //Sign Extension Before Multiplexer
     assign S_ExtendA = Inst_IM_out[3:0];
     SignExtend_M SignExtend_M(.Imm(S_ExtendA),.Imm_Ex(S_ExtendA_out));
     
     //Multilpexer to choose between Immediate or Register Data
     ALU_mux ALU_mux(.Reg_Data(Read_Data2), .Ext_Imm(S_ExtendA_out),.Mux_Out(Mux_OutA),.ALU_Src(ALU_Src));
    
    //Arithmetic Logic Unit
    ALU_Unit ALU_Unit(.ALU_InA(Read_Data1),.ALU_InB(Mux_OutA),.ALU_cont(ALU_cont),.ALU_output(ALU_Output),.ALU_zero(ALU_Zero));
    
    //Data Memory
     Data_Memory Data_Memory(.DMem_In(ALU_Output),.Data_Write(Read_Data2),.Mem_Write(Mem_Write),.Mem_Read(Mem_Read),.clk(clk),.DataM_out(Mem_Out));
    
    //Multiplexer choosing between Memory and ALU
    Mem_Mux Mem_Mux(.Mem_Out(Mem_Out),.ALU_out(ALU_Output),.Mem_to_Reg(Mem_To_Reg),.Mem_Mux_Out(Write_Mem));
    
    //Multiplexer choosing between Jump\Branch and PC+2
    PC_Mux PC_Mux(.JB_Inst(JB_Ins),.PC2_Inst(PC2_Insts),.JBP_enable(JB_sel),.PC_Mux_Out(PC_Inst));
    
    //PC+2 Adder
    Adder_PC Adder_PC(.PC_out(Inst_PC_Out),.PC_Add_out(PC2_Insts));
    
    //Jump Sign Extender
    assign J_Extend = Inst_IM_out[11:0];
    Sign_Extend_Jump Sign_Extend_Jump(.J_imm(J_Extend),.J_extend(Extend_JOut));
    
    //Branch Sign Extender
    assign Extend_BOut =  Inst_IM_out[3:0];
    Sign_Extend_Branch Sign_Extend_Branch(.Branch_Imm(B_Extend),.Branch_Out(Extend_BOut));
    
    //Shift Left for Jump
    Shift_Left_1 Shift_Left_1(.Shift_Jump(Extend_JOut),.Shift_Jump_out(Jump_Inst));
    
    //Shift Left for Branch
    Shift_left_branch Shift_left_branch(.Shift_Branch(Extend_BOut),.Shift_Branch_out(Branch_InstB));
    
    //AND Gate choosing branch
    AND_Gate AND_Gate(.Branch(Branch), .Zero_In(ALU_Zero), .Branch_out(Branch_Sel));
    
        //Branch Multiplexer
    Branch_Mux Branch_Mux(.Branch_Inst(Branch_InstB),.B_Mux_Out(Branch_MOut),.Branch_Sel(Branch_Sel));
    
    //Jump or Branch Multiplexer
    Jump_Mux Jump_Mux(.Jump_Inst(Jump_Inst),.Branch_Inst(Branch_MOut),.Jump_sel(Jump),.Jump_Mux_Out(Jump_Mout));
     
     //Adder for Jump/Branch and PC+2
     Adder_JB Adder_JB(.PC_out(PC2_Inst),.JB_In(Jump_Mout),.JB_Add_out(JB_Ins));
     
     //Control Unit
     assign Opcode =  Inst_IM_out[15:12];
      assign Funct_code =  Inst_IM_out[3:0];
    Control_Unit Control_Unit(.opcode(Opcode),.Funct_field(Funct_code),.ALU_op(ALU_cont),.Mem_Write(Mem_Write), .Mem_Read(Mem_Read),
    .Mem_to_Reg(Mem_To_Reg),.Reg_Write(Reg_Write),.Branch(Branch),.Jump(Jump),.ALU_Src(ALU_Src),.Jump_Branch(JB_sel));
   
   assign ALU_out  = ALU_Output;
   assign pc_out = Inst_PC_Out;
   assign DATA_R1 = Read_Data1;
      assign DATA_R2 =Read_Data2;
   assign IM_output = Inst_IM_out;
   assign ALUop = ALU_cont;
   
endmodule
