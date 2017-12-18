.intel_syntax noprefix

.text

.global dekadne_cifre
# void obrni(int [], int) ;
#               rdi  esi
obrni:
	enter 0,0
	lea rdx, [rdi+4*rsi - 4]
obrni_petlja:
	cmp rdi, rdx
	ja obrni_kraj
	mov r8d, [rdi]
	mov r9d, [rdx]
	mov [rdx], r8d
	mov [rdi], r9d
	add rdi, 4
	sub rdx, 4
	jmp obrni_petlja
obrni_kraj:
	leave
	ret

# void dekadne_cifre(unsigned, unsigned[], int*);
#                         edi         rsi   rdx

dekadne_cifre:
	enter 8,0
	mov [rbp-4], dword ptr 10
	mov dword ptr [rdx], 0
	mov r9, rsi
petlja:
	push rdx
	xor edx, edx
	mov eax, edi
	div dword ptr [rbp-4]
	mov [rsi], edx
	pop rdx
	inc dword ptr [rdx]
	mov edi, eax
	add rsi, 4
	test edi, edi
	jz kraj
	jmp petlja
kraj:
	push rdx
	mov rdi, r9
	mov esi, [rdx]
	call obrni
	pop rdx
	leave
	ret

