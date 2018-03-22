BITS 64

SECTION .text

GLOBAL memmove:function

memmove:
	MOV	RAX, RSI
	CMP	RDI, RAX ;comparaison entre str et str2
	JE	bad_end
	CMP	RDX, 0	 ;check si n == 0
	JE	bad_end
	XOR	RAX, RAX ;i = 0
loop:
	MOV	CL, BYTE[RDI + RAX]
	MOV	BYTE[RSI + RAX], CL
	INC	RAX
	CMP	RAX, RDX ;compare RAX avec R8 (i < n_byte)
	JNE	loop

end:
	MOV	RAX, RSI ;on return la premiere value de rsi
	RET

bad_end:
	RET
