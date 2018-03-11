BITS 64

GLOBAL	strlen:function

SECTION .text

strlen:
	ENTER 0,0
	XOR RCX, RCX

loop:
	CMP	byte[RDI + RCX], 0
	JZ	end
	INC	RCX
	JMP	loop

end:
	MOV	RAX, RCX
	LEAVE
	RET