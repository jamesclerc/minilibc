BITS 64

GLOBAL strstr:function

SECTION .text

strstr:
 	MOVZX	ECX, BYTE[RSI] 	;movzx mov + 0 au début si non remplis
 	MOV	RAX, RDI
	TEST	CL, CL
  	JE	end
  	MOVZX	EAX, BYTE[RDI]
  	TEST	AL, AL
  	JE	bad_end
compare:
  	CMP	CL, AL		;comparaison str == str2 ?
  	JE	comp
incre:
  	INC	RDI		;str++
  	MOVZX	EAX, BYTE[RDI]
  	TEST	AL, AL
  	JNE	compare
bad_end:
  	XOR	EAX, EAX
  	RET
comp:
  	MOV	EDX, ECX
  	XOR	EAX, EAX
loop:
  	CMP	BYTE[RDI + RAX], DL
  	JNE	incre
  	INC	RAX
  	MOVZX	EDX, BYTE[RSI + RAX]
  	TEST	DL, DL
  	JNE	loop
  	MOV	RAX, RDI
end:
  	REP RET
