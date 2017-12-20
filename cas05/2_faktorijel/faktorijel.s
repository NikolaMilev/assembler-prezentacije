.intel_syntax noprefix

.text
.globl faktorijel

# long long unsigned faktorijel(unsigned) ;
#                rax                 edi
faktorijel:
	enter 0,0
	# uslov za izlazak iz rekurzije bice da je argument 0
	# 0! = 1
	test edi, edi
	jz izlazak
	# ukoliko nije ispunjen uslov, spremamo se za rekurzivni
	# poziv
	# stavljamo rdi na stek kako bismo sacuvali vrednost
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
	mul rdi
	# zavrsavamo
	jmp kraj
izlazak:
	mov rax, 1
kraj:
	leave
	ret
