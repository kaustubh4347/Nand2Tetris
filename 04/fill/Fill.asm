// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


@wb
M=0

(init)
	@8192
	D=A
	@n
	M=D // n=8192

	@16384
	D=A
	@addr
	M=D //addr = 16384

	@i
	M=1 //i=1.
	

	(probe)
		@24576
		D=M // checking key
		@Fillblack
		D,JNE
		@Fillwhite
		0,JMP



	
(Fillblack)
	@i
	D=M
	@n
	D=M-D
	@init
	D,JLT
	
	@addr // assign -1 to screen and jump to new address
	A=M
	M=-1

	
	@i  //part of loop i+1 and jump
	M=M+1
	@addr
	M=M+1
	@Fillblack
	0, JMP
	
(Fillwhite)
	@i
	D=M
	@n
	D=M-D
	@init
	D,JLT
	
	@addr // assign -1 to screen and jump to new address
	A=M
	M=0

	
	@i  //part of loop i+1 and jump
	M=M+1
	@addr
	M=M+1
	@Fillwhite
	0, JMP
