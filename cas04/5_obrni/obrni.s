.intel_syntax noprefix

.text
.globl obrni

# void obrni(int[], int) ;
#              rdi  esi

obrni:
	enter 0,0
	# ucitavamo adresu poslednjeg elementa u rcx
	lea rcx, [rdi + rsi*4 - 4]
	# u rdi cuvamo adresu levog elementa za zamenu a u 
	# rcx adresu desnog elementa za zamenu
petlja:
	# ukoliko je adresa levog postala veca od adrese desnog,
	# to znaci da smo zamenili sve neophodne elemente niza sem 
	# eventualnog sredisnjeg (u slucaju neparne duzine niza)
	cmp rdi, rcx
	ja kraj

	# zamenjujemo mesto desnog i levog elementa
	mov r8d, [rdi]
	mov r9d, [rcx]
	mov [rdi], r9d
	mov [rcx], r8d

	# pomeramo levi za 1 mesto u desno
	add rdi, 4
	# pomeramo desni za 1 mesto u levo
	sub rcx, 4
	# skacemo na pocetak petlje
	jmp petlja

kraj:
	leave
	ret

