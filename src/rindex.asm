BITS 64

GLOBAL rindex:function

SECTION .text

rindex:
	ENTER	0, 0
	MOV	RBX, -1
	XOR	RAX, RAX	

getsize:
	INC	RBX	;agit comme un strlen
	CMP	byte[RDI + RBX], 0
	JNE	getsize

loop:
	CMP	[RDI + RBX], SIL ;meme chose que strchr
	JE	end1		 ;on part de la fin
	CMP	RBX, 0		 ;on check jusqu'a ce qu'on trouve
	JE	end		 ;ou qu'on arrive a 0
	DEC	RBX
	JMP	loop

end1:
	ADD	RBX, RDI
	MOV	RAX, RBX
	LEAVE
	RET

end:
	XOR	RAX, RAX
	LEAVE
	RET
