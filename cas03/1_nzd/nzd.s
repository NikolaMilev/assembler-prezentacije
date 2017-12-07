.intel_syntax noprefix

.text
.globl nzd

# unsigned nzd(unsigned, unsigned) ;
#      eax          edi       esi
# iterativno racunamo nzd argumenata
# posto je pretpostavka algoritma da a >= b,
# prvo cemo se osigurati da je zaista tako

nzd:
	enter 0,0
	cmp edi, esi
	jge nastavi
	# vrsimo zamenu argumenata
	mov ecx, edi
	mov edi, esi
	mov esi, ecx

	# nastavljamo
nastavi:
	# ideja:
	# ukoliko je b 0, nzd je a
	# ukoliko je b > 0, tada je nzd(a,b) = nzd(b, a%b)
	# while(b > 0)
	# {
	# 	pom = a % b ;
	# 	a = b ;
	# 	b = pom ;
	# }
	# test radi bitovsku konjunkciju bez upisivanja rezultata
	# test broja sa samim sobom dace 0 kao rezultat akko je taj broj 0
	# alternativa: 
	# 	cmp esi, 0
	# 	je kraj
	#
	test esi, esi
	jz kraj

	# smestamo vrednost prvog argumenta u eax
	mov eax, edi
	# smestamo 0 u edx, kako bi deljenje bilo ispravno
	xor edx, edx
	div esi
	# sada u edx imamo ostatak
	# u prvi smestamo vrednost drugog
	mov edi, esi
	# u drugi smestamo ostatak
	mov esi, edx
	# nastavljamo
	jmp nastavi
kraj:
	mov eax, edi
	leave
	ret

