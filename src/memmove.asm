BITS 64

SECTION .text

GLOBAL memmove:function

memmove:
	mov rax, rsi
	cmp rdi, rsi
	je bad_end
	test rdx, rdx
	je bad_end
	mov r8, rdx
	XOR EAX, EAX

loop:
	movzx ecx, BYTE[rdi+rax]
	mov BYTE[rsi+rax], cl
	add rax, 1
	cmp rax, r8
	jne loop

end:
	lea rax, [rsi+rdx]
	ret

bad_end:
	ret
