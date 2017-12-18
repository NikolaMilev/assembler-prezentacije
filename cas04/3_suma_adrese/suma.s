.intel_syntax noprefix

.text

.globl suma

# int suma(int[], int) ;
# eax        rdi  esi

suma:
	enter 0,0
	# kao vrednost trenutne sume upisujemo 0 (neutral za sabiranje)
	xor eax, eax
	# pamtimo adresu poslednjeg elementa niza
	# kako je niz u memoriji rasporedjen sekvencijalno,
	# znamo da cemo se prosetati do poslednjeg elementa
	lea r8, [rdi+4*rsi-4]
petlja:
	# u rdi ce nam biti adresa trenutnog elementa niza
	# kada prodjemo poslednji element, zavrsavamo petlju
	cmp rdi, r8
	ja kraj
	# inace, dodajemo element niza koji odgovara tom brojacu na sumu
	add eax, [rdi]
	# pomeramo se za jedan element u desno: posto je int velicine 4 bajta,
	# pomeramo se bas toliko
	add rdi, 4
	# skacemo na sledecu iteraciju
	jmp petlja

kraj:
	leave
	ret
