.intel_syntax noprefix

.text

.globl izbaci_neparne

# void izbaci_neparne(int a[], unsigned *len) ;
#                         rdi            rsi

# prilikom svakog izbacivanja, pomeramo sve elemente
# koji su desno od onog koji izbacujemo za jedno mesto u levo
izbaci_neparne:
	enter 0,0
	mov ecx, [rsi]
	# ucitavamo adresu krajnjeg u r9
	lea r9, [rdi+4*rcx-4]
petlja:
	cmp rdi, r9
	ja kraj
	# bitovska konjunkcija sa 0x000001 
	test dword ptr [rdi], 1
	# ako je broj paran, nastavljamo
	jz nastavi_petlja
	#inace, izbacujemo trenutni element
	jmp izbaci
nastavi_petlja:
	add rdi, 4
	jmp petlja

izbaci:
	lea r8, [rdi+4]
izbaci_petlja:
	cmp r8, r9
	ja izbaci_kraj
	mov ecx, [r8]
	mov [r8-4], ecx
	add r8, 4
	jmp izbaci_petlja
izbaci_kraj:
	sub r9, 4
	dec dword ptr [rsi]
	jmp petlja
kraj:
	leave
	ret
