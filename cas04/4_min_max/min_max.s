.intel_syntax noprefix

.text
.globl min_max

# void min_max(int[], int, int*, int*) ;
#                rdi  esi   rdx   rcx

min_max:
	enter 0,0
	cmp esi, 0
	jle kraj
	# cuvamo adresu kraja niza (poslednjeg elementa) u r8
	# radimo direktno sa tom adresom i zbog toga koristimo lea instrukciju
	# moramo koristiti rsi jer vec koristimo rdi kao baznu adresu
	# a bazna adresa i "indeks" moraju biti iste sirine
	lea r8, [rdi + rsi*4 - 4]
	# smestamo u minimum prvi element niza
	mov r9d, [rdi]
	mov [rdx], r9d
	# smestamo u maksimum prvi element niza
	mov r9d, [rdi]
	mov [rcx], r9d
	# pomeramo pokazivac na trenutni element za 4 bajta, tj. za jedno mesto u nizu
	add rdi, 4
petlja:
	# ukoliko smo prosli poslednji element niza, zavrsavamo
	cmp rdi, r8
	ja kraj
	# inace ispitujemo da li treba izmeniti trenutni maksimum i minimum
	# smestamo vrednost trenutnog elementa niza u registar r9d (cmp ne dozvoljava 2 memorijska operanda)
	mov r9d, [rdi]
	# ukoliko je trenutna vrednost manja od dosadasnjeg minimuma, menjamo trenutni minimum
	cmp r9d, [rdx]
	jl promeni_min
	# inace, ukoliko je trenutna vrednost veca od dosadasnjeg maksimuma, menjamo trenutni maksimum
	cmp r9d, [rcx]
	jg promeni_max
	# inace, idemo na sledeci element niza
	jmp sledeca_iteracija
promeni_min:
	# znamo da je u r9d trenutni element niza
	# smestamo ga na adresu sadrzanu u rdx
	mov [rdx], r9d
	jmp sledeca_iteracija
promeni_max:
	# znamo da je u r9d trenutni element niza
	# smestamo ga na adresu sadrzanu u rcx
	mov [rcx], r9d
sledeca_iteracija:
	# pomeramo se na naredni element niza i skacemo na pocetak petlje
	add rdi, 4
	jmp petlja
kraj:
	leave
	ret

