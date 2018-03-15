BITS 64

SECTION .text

GLOBAL memset:function

memset:
	ENTER	0,0

	XOR	RCX,RCX

loop:
	CMP	RCX, RDX ;compare the bite with rdx
	JZ	end
	MOV	[RDI + RCX], SIL  ;*rdi + rcx = char(rsi)
	INC	RCX
	JMP	loop

end:
	MOV	RAX, RDI
	LEAVE
	RET
