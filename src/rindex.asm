BITS 64

GLOBAL rindex:function

SECTION .text

rindex:
	ENTER	0, 0
	MOV	RBX, -1
	XOR	RAX, RAX	

getsize:
	INC	RBX
	CMP	byte[RDI + RBX], 0
	JNE	getsize

loop:
	CMP	[RDI + RBX], SIL
	JE	end1
	CMP	RBX, 0
	JE	end
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
