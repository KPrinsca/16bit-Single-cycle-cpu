`timescale 1ns/1ps

module Control_Unit_test();
    reg [3:0] opcode, Funct_field;
    wire [3:0] ALU_op;
    wire Mem_Write, Mem_Read, Mem_to_Reg, Reg_Write, 
         Branch, Jump, ALU_Src, Jump_Branch;
    integer test_num = 1;
    integer passed_tests = 0;
    integer failed_tests = 0;
    
    Control_Unit uut(
        .opcode(opcode),
        .Funct_field(Funct_field),
        .ALU_op(ALU_op),
        .Mem_Write(Mem_Write),
        .Mem_Read(Mem_Read),
        .Mem_to_Reg(Mem_to_Reg),
        .Reg_Write(Reg_Write),
        .Branch(Branch),
        .Jump(Jump),
        .ALU_Src(ALU_Src),
        .Jump_Branch(Jump_Branch)
    );

    task check_rtype;
        input [3:0] expected_alu_op;
        input [3:0] funct_code;
        begin
            opcode = 4'b0000;
            Funct_field = funct_code;
            #10;
            
            if(ALU_op !== expected_alu_op || 
               Reg_Write !== 1'b1 ||
               ALU_Src !== 1'b0 ||
               Mem_Write !== 1'b0 ||
               Mem_Read !== 1'b0) 
            begin
                $display("Test %0d (R-type %b) FAILED - Got ALU_op=%b, RegW=%b, ALUSrc=%b, MemW=%b, MemR=%b",
                        test_num, funct_code, ALU_op, Reg_Write, ALU_Src, Mem_Write, Mem_Read);
                failed_tests = failed_tests + 1;
            end
            else begin
                $display("Test %0d (R-type %b) PASSED", test_num, funct_code);
                passed_tests = passed_tests + 1;
            end
            test_num = test_num + 1;
        end
    endtask

    task check_lw;
        begin
            opcode = 4'b0001;  // LW
            #10;
            if(ALU_op !== 4'b0000 || Mem_Read !== 1'b1 || 
               Reg_Write !== 1'b1 || ALU_Src !== 1'b1 || 
               Mem_to_Reg !== 1'b1 || Mem_Write !== 1'b0) 
            begin
                $display("Test %0d (LW) FAILED - Got ALU_op=%b, MemR=%b, RegW=%b, ALUSrc=%b, Mem2Reg=%b, MemW=%b",
                        test_num, ALU_op, Mem_Read, Reg_Write, ALU_Src, Mem_to_Reg, Mem_Write);
                failed_tests = failed_tests + 1;
            end
            else begin
                $display("Test %0d (LW) PASSED", test_num);
                passed_tests = passed_tests + 1;
            end
            test_num = test_num + 1;
        end
    endtask

    task check_sw;
        begin
            opcode = 4'b0010;  // SW
            #10;
            if(ALU_op !== 4'b0000 || Mem_Write !== 1'b1 || 
               ALU_Src !== 1'b1 || Reg_Write !== 1'b0 ||
               Mem_Read !== 1'b0)
            begin
                $display("Test %0d (SW) FAILED - Got ALU_op=%b, MemW=%b, ALUSrc=%b, RegW=%b, MemR=%b",
                        test_num, ALU_op, Mem_Write, ALU_Src, Reg_Write, Mem_Read);
                failed_tests = failed_tests + 1;
            end
            else begin
                $display("Test %0d (SW) PASSED", test_num);
                passed_tests = passed_tests + 1;
            end
            test_num = test_num + 1;
        end
    endtask

    task check_addi;
        begin
            opcode = 4'b0011;  // ADDI
            #10;
            if(ALU_op !== 4'b0000 || Reg_Write !== 1'b1 || 
               ALU_Src !== 1'b1 || Mem_to_Reg !== 1'b0 ||
               Mem_Write !== 1'b0 || Mem_Read !== 1'b0)
            begin
                $display("Test %0d (ADDI) FAILED - Got ALU_op=%b, RegW=%b, ALUSrc=%b, Mem2Reg=%b, MemW=%b, MemR=%b",
                        test_num, ALU_op, Reg_Write, ALU_Src, Mem_to_Reg, Mem_Write, Mem_Read);
                failed_tests = failed_tests + 1;
            end
            else begin
                $display("Test %0d (ADDI) PASSED", test_num);
                passed_tests = passed_tests + 1;
            end
            test_num = test_num + 1;
        end
    endtask

    task check_beq;
        begin
            opcode = 4'b0100;  // BEQ
            #10;
            if(ALU_op !== 4'b0001 || Branch !== 1'b1 || 
               Jump_Branch !== 1'b1 || ALU_Src !== 1'b0 ||
               Reg_Write !== 1'b0)
            begin
                $display("Test %0d (BEQ) FAILED - Got ALU_op=%b, Branch=%b, JmpBr=%b, ALUSrc=%b, RegW=%b",
                        test_num, ALU_op, Branch, Jump_Branch, ALU_Src, Reg_Write);
                failed_tests = failed_tests + 1;
            end
            else begin
                $display("Test %0d (BEQ) PASSED", test_num);
                passed_tests = passed_tests + 1;
            end
            test_num = test_num + 1;
        end
    endtask

    task check_bne;
        begin
            opcode = 4'b0101;  // BNE
            #10;
            if(ALU_op !== 4'b0001 || Branch !== 1'b1 || 
               Jump_Branch !== 1'b1 || ALU_Src !== 1'b0 ||
               Reg_Write !== 1'b0)
            begin
                $display("Test %0d (BNE) FAILED - Got ALU_op=%b, Branch=%b, JmpBr=%b, ALUSrc=%b, RegW=%b",
                        test_num, ALU_op, Branch, Jump_Branch, ALU_Src, Reg_Write);
                failed_tests = failed_tests + 1;
            end
            else begin
                $display("Test %0d (BNE) PASSED", test_num);
                passed_tests = passed_tests + 1;
            end
            test_num = test_num + 1;
        end
    endtask

    task check_jmp;
        begin
            opcode = 4'b0110;  // JMP
            #10;
            if(!(Jump === 1'b1 && 
                Jump_Branch === 1'b1 && 
                Branch === 1'b0 && 
                ALU_op === 4'bxxxx)) 
            begin
                $display("Test %0d (JMP) FAILED - Got Jump=%b, JmpBr=%b, Branch=%b, ALU_op=%b",
                        test_num, Jump, Jump_Branch, Branch, ALU_op);
                failed_tests = failed_tests + 1;
            end
            else begin
                $display("Test %0d (JMP) PASSED", test_num);
                passed_tests = passed_tests + 1;
            end
            test_num = test_num + 1;
        end
    endtask

    initial begin
        $display("Starting Control Unit Tests...");
        $display("---------------------------");
        
        // Test R-type instructions
        check_rtype(4'b0000, 4'b0000);  // ADD
        check_rtype(4'b0001, 4'b0001);  // SUB
        check_rtype(4'b0010, 4'b0010);  // SLL
        check_rtype(4'b0011, 4'b0011);  // AND
        
        // Test I-type and J-type instructions
        check_lw();
        check_sw();
        check_addi();
        check_beq();
        check_bne();
        check_jmp();
        
        $display("\nTest Summary:");
        $display("Passed: %0d", passed_tests);
        $display("Failed: %0d", failed_tests);
        $display("Total:  %0d", test_num-1);
        $display("---------------------------");
        $display("All tests completed");
        $finish;
    end
endmodule
