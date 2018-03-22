BITS 64

GLOBAL	strncmp:function

SECTION .text

strncmp:
	ENTER	0, 0

	XOR	RAX, RAX
	XOR	RCX, RCX
	XOR	R9, R9
	XOR	R8, R8

loop:
	MOV	AL, byte[RDI + R9] 	;same program as strcmp but we check the 
	MOV	CL, byte[RSI + R9]
	CMP	R9, RDX		  	;compare i == size_t n
	JZ	end_zero		;go to end and return (0)
	CMP	AL, 0			;if s1 == '\0'
	JZ	end			;goto end same for s2
	CMP	CL, 0
	JZ	end
	CMP	AL, CL			;if s1 != s2
	JNZ	end			
	INC	R9			;i++
	INC	R8
	CMP	R9, R8
	JMP	loop

end_zero:
	XOR	RAX, RAX		;end with ret 0
	LEAVE
	RET

end:
	sub	RAX, RCX		;subsract and return
	LEAVE
	RET
