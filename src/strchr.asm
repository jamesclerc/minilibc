BITS 64

GLOBAL	strchr:function

SECTION .text

strlen:
	ENTER 0,0
	XOR RCX, RCX

loop:
	CMP	byte[RDI + RCX], 0
	JZ	end
	CMP	byte[RDI + RCX], SIL
	JE	end1
	INC	RCX
	JMP	loop

end1:
	MOV	RAX, [RDI + RCX]
	LEAVE
	RET

end:
	MOV	RAX, RCX
	LEAVE
	RET