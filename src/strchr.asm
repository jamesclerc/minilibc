BITS 64

GLOBAL	strchr:function

SECTION .text

strchr:
	ENTER 0,0
	XOR RAX, RAX

loop:
	CMP	byte[RDI], SIL 	;compare str with 2 arg(8 bit)
	JE	end1		; if equal return pointer
	CMP	byte[RDI], 0	;compare str with end
	JZ	end		;if equal return NULL
	INC	RDI		;inc str++
	JMP	loop		;call while

end1:
	ADD	RAX, RDI
	LEAVE
	RET

end:
	MOV	RAX, 0
	LEAVE
	RET
