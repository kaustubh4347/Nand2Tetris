// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@R0
D=M 

@n
M=D // take n from RAM[0]

@i
M=1

@Mult
M=0

(loop)
	@i
	D=M
	@n
	D=M-D
	@stop
	D,JLT
	@R1
	D=M
	@Mult
	M=D+M
	@i
	M=M+1
	@loop
	0,JMP
	
(stop)
@Mult
D=M
@R2
M=D
@stop
0,JMP
	