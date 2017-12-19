.intel_syntax noprefix

.text
.globl nzd

# unsigned nzd(unsigned, unsigned) ;
#      eax          edi       esi
# iterativno racunamo nzd argumenata Euklidovim algoritmom
nzd:
	enter 0,0
petlja:
	# ideja:
	# ukoliko je b = 0, nzd(a,0) = a
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
	jmp petlja
kraj:
	mov eax, edi
	leave
	ret

