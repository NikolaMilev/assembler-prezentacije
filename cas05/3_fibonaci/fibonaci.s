.intel_syntax noprefix

.text
.globl fibonaci

# unsigned fibonaci(unsigned n) ;
#      eax                 edi

fibonaci:
	enter 0,0
	# ukoliko je redno broj 0, vracamo 0
	test edi, edi
	je nula
	# ukoliko je redno broj 1, vracamo 1
	cmp edi, 1
	je jedan
	# inace, rekurzivno pozivamo funkciju za n-1 i za n-2
	# priprema za poziv n-1
	push rdi
	sub rsp, 8
	dec edi
	call fibonaci
	add rsp, 8
	pop rdi

	# smestamo povratnu vrednost u ecx jer ce u eax biti
	# povratna vrednost narednog poziva
	# rekurzivno pozivamo funkciju za n-2
	mov ecx, eax
	push rdi
	push rcx
	sub edi, 2
	call fibonaci
	pop rcx
	pop rdi
	# sabiramo vrednosti fibonaci(n-1) i fibonaci(n-2)
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
	