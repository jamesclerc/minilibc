BITS 64

GLOBAL	strcmp:function

SECTION .text

strcmp:
	ENTER 0,0

	XOR	RCX, RCX ;initialisation à 0 des 2 compteur
	XOR	RBX, RBX

loop:
	MOV	BL, [RDI] ; assigne la valeur du premier bit du premer argument dans BL (sous registre de RBX)
	MOV	CL, [RSI] ; assigne la valeur du bit de RSI (second arg) dans CL (sous registre de RCX)
	CMP	BL, CL	; comparaison entre deux meme registre fonctionne (cmp byte[rdi], byte[rsi] fonctionne pas)
	JE	end
	CMP	BL, 0 ; if end
	JE	end
	CMP	CL, 0 ; if second end
	JE	end
	INC	RSI ; inc du pointeur
	INC	RDI ;inc du pointeur
	JMP	loop

end:
	SUB	BL, CL ; soustraction pour avoir le résultat
	MOVSX	RAX, BL ; move BL dans RAX avec bits signé
	RET
