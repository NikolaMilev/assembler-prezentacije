.intel_syntax noprefix

.text
.globl obrni

# void obrni(long[], int) ;
#               rdi  esi

obrni:
	enter 0,0
	# ucitavamo adresu poslednjeg elementa u rcx
	lea rcx, [rdi + rsi*8 - 8]
	# u rdi cuvamo adresu levog elementa za zamenu a u 
	# rcx adresu desnog elementa za zamenu
petlja:
	# ukoliko je adresa levog postala veca od adrese desnog,
	# to znaci da smo zamenili sve neophodne elemente niza sem 
	# eventualnog sredisnjeg (u slucaju neparne duzine niza)
	cmp rdi, rcx
	ja kraj

	# zamenjujemo mesto desnog i levog elementa
	mov r8, [rdi]
	mov r9, [rcx]
	mov [rdi], r9
	mov [rcx], r8

	# pomeramo levi za 1 mesto u desno
	add rdi, 8
	# pomeramo desni za 1 mesto u levo
	sub rcx, 8
	# skacemo na pocetak petlje
	jmp petlja

kraj:
	leave
	ret

