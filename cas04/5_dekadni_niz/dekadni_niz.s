.intel_syntax noprefix

.text

.global dekadni_niz


# funkcija za obrtanje iz zadatka 4
obrni:
	enter 0,0
	lea rcx, [rdi + rsi*4 - 4]
petlja_obrni:
	cmp rdi, rcx
	ja kraj_obrni
	mov r8d, [rdi]
	mov r9d, [rcx]
	mov [rdi], r9d
	mov [rcx], r8d
	add rdi, 4
	sub rcx, 4
	jmp petlja_obrni
kraj_obrni:
	leave
	ret

# int dekadni_niz(unsigned, int[]) ;
# eax                  edi    rsi

dekadni_niz:
	enter 8,0
	# u ecx cuvamo dosadasnju duzinu niza
	xor ecx, ecx
	# u r8 cuvamo adresu trenutnog elementa niza
	# cuvamo kopiju jer ce nam za poziv funkcije obrni trebati adresa
	# pocetnog elementa niza
	mov r8, rsi
	mov [rbp-4], dword ptr 10
dek_niz_petlja:
	# spremamo se za deljenje
	mov eax, edi
	xor edx, edx
	div dword ptr [rbp-4]
	# u edx je ostatak, i to pisemo kao trenutnu cifru broja
	mov [r8], edx
	# pomeramo se za jedno mesto desno u nizu
	add r8, 4
	# upisujemo u edi kolicnik broja i 10
	mov edi, eax
	# povecavamo brojac cifara
	inc ecx
	# proveravamo da li je kolicnik 0 i, ako jeste, iskacemo iz petlje
	test eax, eax
	jz dek_niz_kraj
	# skacemo na pocetak petlje
	jmp dek_niz_petlja
dek_niz_kraj:
	# na samom kraju cemo pozvati funkciju obrni kako bismo broj dobili
	# u redosledu u kom se cifre pojavljuju, od cifre najvece tezine do
	# cifre najmanje tezine
	push rcx
	mov rdi, rsi
	mov esi, ecx
	call obrni
	pop rcx
	mov eax, ecx
	leave
	ret

