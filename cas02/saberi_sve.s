.intel_syntax noprefix

.data
	form1: .asciz "%d %d"
	form2: .asciz "Zbir: %d\n"

.text
	.globl main

saberi:
	enter 0,0
	mov eax, edi
	add eax, esi
	leave
	ret

main:
	enter 8,0
	push rcx

	lea rdi, form1
	lea rsi, [rbp-4]
	lea rdx, [rbp-8]
	mov rax, 0
	call scanf

	mov edi, [rbp-4]
	mov esi, [rbp-8]
	call saberi

	lea rdi, form2
	mov esi, eax
	mov rax, 0
	call printf

	leave
	ret

	