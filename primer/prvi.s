.intel_syntax noprefix

.data
	form1: .asciz "%d %d"
	form2: .asciz "Zbir: %d\n"

.text 

	.globl saberi
	.global main

	saberi:
		enter 0,0
		mov eax, edi
		add eax, esi
		leave
		ret

main:
	enter 8,0
	push rbx

	mov rbx, rbp
	sub rbx, 4
	lea rdi, form1
	mov rsi, rbx
	sub rbx, 4
	mov rdx, rbx
	mov rax, 0
	call scanf

	mov edi, [rbp-4]
	mov esi, [rbp-8]
	call saberi

	lea rdi, form2
	mov esi, eax
	mov eax, 0
	call printf

	pop rbx
	leave
	ret

