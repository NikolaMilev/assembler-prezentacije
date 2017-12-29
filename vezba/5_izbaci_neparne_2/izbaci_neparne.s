.intel_syntax noprefix

.text
.globl izbaci_neparne
# void izbaci_neparne(long a[], int *n) ;
#                          rdi     rsi

# uradjeno na drugi nacin, samo jednom prolazimo kroz niz
# pamtimo adresu gde ubacujemo parni element u r8
# ukoliko je element paran, prebacujemo ga na adresu r8 i pomeramo r8 za jedno mesto u desno
# ukoliko je element neparan, samo smanjujemo duzinu niza
izbaci_neparne:
	enter 0,0
	mov ecx, [rsi]
	lea r9, [rdi + 8*rcx - 8]
	mov r8, rdi
petlja:
	cmp rdi, r9
	ja kraj
	test qword ptr [rdi], 1
	jz pomeri
	dec dword ptr [rsi]
	jmp petlja_priprema
pomeri:
	mov rcx, [rdi]
	mov [r8], rcx
	add r8, 8
petlja_priprema:
	add rdi, 8
	jmp petlja
kraj:
	leave
	ret



