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
	mov r8d, esi
	add r8d, edx
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
# idemo u desnu polovinu niza: umesto desnog kraja pisemo sredisnji+1
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
	mov eax, r8d
	jmp kraj
nije:
	# indeks -1 nije validan indeks niza pa ga stavljamo kao indikator neuspeha
	mov eax, -1
kraj:
	leave
	ret


