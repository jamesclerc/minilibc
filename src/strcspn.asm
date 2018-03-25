BITS 64

GLOBAL strcspn:function

SECTION .text

strcspn:
	MOV	RAX, RDI
loop:
	LEA	R9, [RAX + 1]
	MOV	RDX, RSI
	MOVZX	R8D, BYTE[R9 - 1]
	JMP	incre
check:
	TEST	CL, CL
	JE	movv
incre:
	ADD	RDX, 1
	MOVZX	ECX, BYTE[RDX - 1]
	CMP	R8B, CL
	JNE	check
	SUB	RAX, RDI
	RET
movv:
	MOV	RAX, R9
	JMP	loop
