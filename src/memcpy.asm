BITS 64

SECTION .text

GLOBAL memcpy:function

memcpy:
	ENTER	0,0
	
	XOR	RBX, RBX
	MOV	RAX, RDI

loop:
	CMP	RBX, RDX ;compare rdx == rcx
	JZ	end
	MOV	SPL, byte[RSI + RBX]
	MOV	byte[RDI + RBX], SPL
	INC	RBX
	JMP	loop

end:
	LEAVE
	RET
