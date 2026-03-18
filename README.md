# RV32I -TYPE

## Instuction_memory

:Senario를 구성하고 실행하는 메모리 or 실행할 프로그램의 명령어들이 저장되는 공간 

1. rom[]코드를 사용하여 , 시나리오 작성

<img width="571" height="378" alt="image 1" src="https://github.com/user-attachments/assets/6d5ab2ff-8cb5-484b-94d7-017dbaecbc80" />


1. Memory_file를 통한 ASM (Asembly Code)를 통해 동작

<img width="852" height="345" alt="image 2" src="https://github.com/user-attachments/assets/bf2a75bd-cd99-480a-9c0c-8f4a4737157b" />


## RV32I_cpu

－ control_unit과 datapath로 구성하고 있는 형태

- Control_unit 
- 각 Type에서 신호를 정의하는 역할

<img width="317" height="602" alt="image 3" src="https://github.com/user-attachments/assets/bf9773bd-e441-41cb-8d40-a15af42ea704" />


1.  DataPath 
- Control_unit의 신호가 input으로 들어와 신호에 다른 동작을 실행 

## RV32I_Datapath

— Register_file & PC(Program Counter) & Imm extender & ALU로 구성

- Register_file 
- input : RA1, RA2, RD, WD(wirte data), Wdata, rf_we(register file wirte enable) 
- output: RD1, RD2
- rf_we와 WA의 신호값을통해 값을 저장
Condition:  (!rst & rf_we & WA ≠ 5’d0)

- ALU: 자동으로 연산을 해주는 모듈 
-  R, B-Type의 연산을 alu_control의 신호를 통해 확인 후 각 지정된 명령어를 수행 
- R-Type
: ADD, SUB,SLL,SLT등 
- B-Type
:BEQ, BNE, BLT등

- PC(Program Counter)
: 현재의 주소를 나타내며, 동시에 B-Type이나 J-Type의 Jump를 사용하기 위해 사용

- Pc+4를 위한 alu
- PC의 값이 잠깐 저장을 할 수 있는 Register
- rd1과 PC의 값을 선택하기 위한 mux_2x1
- pc+4의 값과, mux(pc, imm)를 선택하는 mux_2x1

- Imm extender
: 상수값(Immidiate)을 사용하는 Type을 위해 사용되어진다. (I , B, U, J)

## Data_Memory

: Byte Store 구조 —> S-type과 IL-Type에 사용

- S-Type
: funct3 == 101(SW)
- 32bit store
    
    : funct3 == 001(SH)
    - 16bit store
    - Check if a number is odd or even 
    
    : funct3 == 000(SB)
    - 8bit store
    
- IL-Type(Load)
    
    
    : funct3 == 000(LB)
    - 32bit store
    
    : funct3 == 001(LH)
    - 16bit store
    - Check if a number is odd or even 
    
    : funct3 == 010(LW)
    - 8bit store
    

## Define(Verilog Header)

각 Type의 Opcode를 정의 R-Type Instruction, B-Type Instruction 정의

<img width="543" height="489" alt="image 4" src="https://github.com/user-attachments/assets/3becb2b5-1482-40ca-a7ec-c9ea110418df" />


## Memory_File

: i의 반복문을 이용하여, sum의 값을 출력하는 C code를 제작 후 ASM code변경 후 사용

<img width="543" height="489" alt="image 4" src="https://github.com/user-attachments/assets/570b931f-a5eb-4712-bc44-72e7609a8b1b" />

