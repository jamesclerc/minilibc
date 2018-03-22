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
	MOV	SPL, byte[RSI + RBX] ;on déplace le bit str + i dans spl
	MOV	byte[RDI + RBX], SPL ;on y remplace dans rdi
	INC	RBX			; i++
	JMP	loop

end:
	LEAVE
	RET
