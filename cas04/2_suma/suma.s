.intel_syntax noprefix

.text

.globl suma

# int suma(int[], int) ;
# eax        rdi  esi

suma:
	enter 0,0
	# kao vrednost trenutne sume upisujemo 0 (neutral za sabiranje)
	xor eax, eax
	# trenutni brojac je 0 
	xor rcx, rcx
petlja:
	# ukoliko je brojac >= n, zavrsavamo
	cmp ecx, esi
	jge kraj
	# inace, dodajemo element niza koji odgovara tom brojacu na sumu
	add eax, [rdi+4*rcx]
	# povecavamo brojac
	inc ecx
	# skacemo na sledecu iteraciju
	jmp petlja

kraj:
	leave
	ret
