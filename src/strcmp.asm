BITS 64

GLOBAL strcmp:function

SECTION .text

strcmp:
	ENTER	0, 0
	XOR	RCX, RCX
	XOR	RAX, RAX
	XOR	RBX, RBX

loop:
	MOV	AL, byte[RDI + RBX]	;Move str1 byte in RAX(8bit)
	MOV	CL, byte[RSI + RBX]	;Move str2 byte in RCX(8bit)
	CMP	byte[RDI + RBX], 0	;if end of str1
	JZ	end			;jump if str1[i] == '\0'
	CMP	byte[RSI + RBX], 0	;jump if str2[i] == '\0'
	JZ	end			;if end of str2
	CMP	AL, CL			;compare str1[i] == str2[i]
	JNZ	end			;if false
	INC	RBX			;inc i
	JMP	loop			;redo while

end:
	SUB	RAX, RCX		;sub last charac of str1 - str2
	LEAVE
	RET				; return
