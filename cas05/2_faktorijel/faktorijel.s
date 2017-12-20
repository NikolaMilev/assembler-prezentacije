.intel_syntax noprefix

.text
.globl faktorijel

# unsigned long faktorijel(unsigned) ;
#           rax                 edi
faktorijel:
	enter 0,0
	# uslov za izlazak iz rekurzije bice da je argument 0
	# 0! = 1
	test edi, edi
	jz izlazak
	# ukoliko nije ispunjen uslov, spremamo se za rekurzivni
	# poziv
	# stavljamo rdi na stek kako bismo sacuvali vrednost
	# cuvanje rdi na steku je uvek ispravno
	# u ovom slucaju, mozemo umesto cuvanja ove vrednosti na steku
	# nakon poziva uvecati edi za 1 i na taj nacin cuva se vrednost
	# na ovaj nacin ne moramo da punimo stek sa 16 bajtova pri svakom rekurzivnom pozivu
	push rdi
	# umanjujemo rsp za 8 jer je push rdi smanjio adresu
	# vrha steka za 8 a ta adresa mora biti deljiva sa 16 
	# pre call instrukcije
	sub rsp, 8
	# posto rekurzivno pozivamo funkciju za jedan manje od argumenta,
	# umanjujemo ga
	dec edi
	# poziv
	call faktorijel
	# vracanje steka u stanje pre poziva
	add rsp, 8
	# skidamo staru vrednost argumenta
	pop rdi
	# posto je u rax rezultat poziva, to je (n-1)!
	# ostalo nam je jedino da pomnozimo sa n
	# ukoliko postoji sansa da je u visa 4 bajta bilo
	# nesto sem 0, uradicemo
	# mov edi, edi
	mul rdi
	# zavrsavamo
	jmp kraj
izlazak:
	mov rax, 1
kraj:
	leave
	ret
