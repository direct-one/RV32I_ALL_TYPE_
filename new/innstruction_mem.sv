`timescale 1ns / 1ps


module instruction_mem(
    input [31:0] instr_addr,
    output [31:0] instr_data
    );

    logic [31:0] rom[0:31];

    initial begin
        $readmemh("riscv_rv32i_rom_data.mem", rom);
    
    
    //rom[0]  = 32'h000010b7; //  LUI   x1, 1       (x1 = 0x00001000)
    //rom[1]  = 32'h00001117; //  AUIPC x2, 1       (x2 = PC + 0x1000)
    //rom[2]  = 32'h004001ef; //  JAL   x3, 4       (x3 = PC+4 store, PC+4 Jump)
    //rom[3]  = 32'h00018267; //  JALR  x4, x3, 0   (x4 = PC+4 store, x3 Jump)

        

    end

    assign instr_data = rom[instr_addr[31:2]]; // delete '0', '1'

endmodule


        //practice code 
        //rom[0] = 32'h005102a3; // SB x5  5(x2)
        //rom[1] = 32'h002102a3; // SB x2  5(x2)
        //rom[2] = 32'h005102a3; // SB x5  5(x2)
        //rom[3] = 32'h002102a3; // SB x2  5(x2)
        //rom[4] = 32'h005102a3; // SB x5  5(x2)
        //rom[0] = 32'h00511123;  // SH x5 2(x2)

        //rom[0]  = 32'h000010b7; //  LUI   x1, 1       (x1 = 0x00001000)
    //rom[1]  = 32'h00001117; //  AUIPC x2, 1       (x2 = PC + 0x1000)
    //rom[2]  = 32'h004001ef; //  JAL   x3, 4       (x3 = PC+4 store, PC+4 Jump)
    //rom[3]  = 32'h00018267; //  JALR  x4, x3, 0   (x4 = PC+4 store, x3 Jump)

        
        //rom[3] = 32'h00211123;
        //rom[2] = 32'h00211123;
        //rom[2] =32'h402852b3;  
        
        //rom[0] = 32'h00402023;  //x4,0(x0)
        //rom[1] = 32'h00a020a3;  //x10,1(x0)
        //rom[2] = 32'h00000283;  //x5, 0(x0)
        
        
        //professor code 
        //rom[0] =32'h004182b3;  //  ADD X5, X3, X4
        //rom[1] = 32'h00812123; // SW x8, 2(x2),
        //rom[2] = 32'h00212383;  // LW, x7 x2, 2
        //rom[3] = 32'h00438413;  //  ADDI X8, X7, 4
        //rom[4] = 32'h00840463; //BEQ x8 x8,8
        //rom[5] =32'h004182b3;  //  ADD X5, X3, X4
        //rom[6] = 32'h00812123; // SW x8, 2(x2),
        