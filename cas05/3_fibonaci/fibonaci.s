.intel_syntax noprefix

.text
.globl fibonaci

# unsigned fibonaci(unsigned) ;
#      eax               edi

fibonaci:
	enter 0,0
	test edi, edi
	je nula
	cmp edi, 1
	je jedan
	push rdi
	sub rsp, 8
	dec edi
	call fibonaci
	add rsp, 8
	pop rdi

	mov ecx, eax
	push rdi
	push rcx
	sub edi, 2
	call fibonaci
	pop rcx
	pop rdi
	add eax, ecx
	jmp kraj

jedan:
	mov eax, 1
	jmp kraj
nula:
	xor eax, eax
kraj:
	leave
	ret  
	