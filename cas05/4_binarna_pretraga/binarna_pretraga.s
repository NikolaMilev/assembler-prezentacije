.intel_syntax noprefix

.text
.globl binarna_pretraga
# int binarna_pretraga(int a[], int poc, int kr, int elem) ;
# eax                      rdi      esi     edx       ecx

binarna_pretraga:
	enter 0,0
	# ukoliko je indeks pocetka veci od indeksa kraja, 
	# zavrsavamo bez uspeha
	cmp esi, edx
	jg nije

	# trazimo indeks sredisnjeg elementa
	# mov r8d, esi ce prepisati sadrzaj registra
	# niza 4 bajta registra rsi u niza 4 bajta registra r8
	# dok ce u visa 4 bajta upisati 0
	mov r8d, esi
	add r8d, edx
	# posto su indeksi oznacene promenljive, radimo aritmeticko siftovanje
	# ovde ne bi smelo da nam znaci da li koristimo
	# aritmeticko ili logicko siftovanje
	# jer ovaj prosek ne bi smeo da bude negativan broj
	sar r8d, 1

	# poredimo element na sredisnjem indeksu sa vrednosti koju trazimo
	cmp ecx, [rdi+4*r8]
	# ukoliko je manji od sredisnjeg, pretrazujemo levu polovinu niza
	jl levo
	# ukoliko je veci od sredisnjeg, pretrazujemo desnu polovinu niza
	jg desno
	# ukoliko nije ni manji ni veci, mora biti jednak i nasli smo ga
	jmp jeste

# idemo u levu polovinu niza: umesto desnog kraja pisemo sredisnji-1
levo:
	mov edx, r8d
	dec edx
	jmp poziv
# idemo u desnu polovinu niza: umesto levog kraja pisemo sredisnji+1
desno:
	mov esi, r8d
	inc esi
# ovde izvrsavamo rekurzivni poziv
poziv:
	# nije neophodno da pamtimo registre koje smo koristili
	# jer ih nigde dalje u funkciji ne koristimo
	# nije neophodno da podesavamo parametre jer 
	# su vec podeseni kako treba:
	# 	rdi i ecx ne menjamo
	# 	esi/edx je namesten skokom na labelu desni/levi (redom)
	call binarna_pretraga
	# nakon poziva skacemo na kraj; u eax je rezultat rekurzivnog poziva
	jmp kraj
jeste:
	# element koji trazimo je na indeksu sredisnjeg elementa koji smo izracunali
	# i smestili u r8d
	mov eax, r8d
	jmp kraj
nije:
	# indeks -1 nije validan indeks niza pa ga stavljamo kao indikator neuspeha
	mov eax, -1
kraj:
	leave
	ret


