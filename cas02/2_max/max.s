.intel_syntax noprefix

.text
.globl maksimum
# int maksimum(int a, int b) ;
# eax          edi    esi
maksimum:
	# prolog
	enter 0,0
	# poredimo sadrzaje registara edi i esi
	# cmp intrukcija vrsi oduzimanje ali ne upisuje rezultat
	# u jedan od operanada vec postavlja rflags registar
	cmp edi, esi
	# ukoliko prvi nije veci od drugog, tada je drugi sigurno maksimum
	# jng instrukcija vrsi skok na adresu koja je data kao operand
	# ukoliko rezultat prethodnog poredjenja nije vece 
	jng drugi
	# ukoliko uslov skoka nije tacan, nastavljamo sa izvrsavanjem od sledece instrukcije

	# ukoliko rezultat prethodnog poredjenja jeste vece, tada znamo da 
	# je prvi maksimum i stavljamo ga u registar koji cuva povratnu vrednost
	mov eax, edi
	# jmp instrukcija bezuslovno skace na adresu koja je data kao operand
	jmp kraj
drugi:
	# u slucaju da je drugi maksimum, smestamo ga u registar
	# koji cuva povratnu vrednost
	# ovde nije neophodno da skacemo jer ce se izvrsavanje nastaviti
	# od naredne instrukcije, tj. leave
	mov eax, esi
kraj:
	leave
	ret

