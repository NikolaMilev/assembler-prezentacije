.intel_syntax noprefix

.data
.text
	.globl racunaj

#	int racunaj(int a, int b, char op) ;
#	eax			edi	   esi    dl
# kako kao treci argument prosledjujemo char, dovoljno je da posmatramo
# najnizih 8 bajtova registra rdx, odnosno dl
# pretpostavka je da ce funkciji biti prosledjen tacno jedan od karaktera
# +, -, *, / ili % kao treci argument
racunaj:
	enter 0,0
	# poredimo sadrzaj registra dl sa karakterom +
	cmp dl, '+'
	# ukoliko su jednaki, skacemo na adresu koju predstavlja
	# labela saberi
	je saberi
	# ukoliko nisu jednaki, nastavljamo dalje
	# proces ispitivanja isti je za ostale karaktere
	cmp dl, '-'
	je oduzmi
	cmp dl, '*'
	je pomnozi
	cmp dl, '/'
	je podeli
	cmp dl, '%'
	je ost
	mov eax, 0
	jmp kraj
saberi:
	# vrsimo sabiranje i skacemo na kraj programa
	mov eax, edi
	add eax, esi
	jmp kraj
oduzmi:
	# vrsimo oduzimanje i skacemo na kraj programa
	mov eax, edi
	sub eax, esi
	jmp kraj
pomnozi:
	# vrsimo oznaceno mnozenje i skacemo na kraj programa
	# kod mnozenja, mnozimo sadrzaj registra rax sa operandom instrukcije
	# i rezultat smestamo u  rdx:rax
	# ako je operand manji od 8 bajtova, npr. 4 bajta, tada
	# se sadrzaj registra eax mnozi sa operandom i rezultat se smesta u 
	# edx:eax, itd.
	# ovde nije potrebno nista prosirivati
	mov eax, edi
	imul esi
	jmp kraj
podeli:
	# pri oznacenom deljenju, sadrzaj registara rdx:rax deli se operandom
	# kolicnik se nalazi u rax a ostatak u rdx
	# ukoliko je operand cetvorobajtni, 
	# tada se sadrzaj edx:eax deli operandom i kolicnik ostaje u eax
	# a ostatak u edx 
	mov rax, rdi
	
	cqo
	idiv rsi
	jmp kraj
ost:
	# slicno kao za deljenje s tim sto uzimamo edx
	mov eax, edi
	cdqe
	cdq 
	idiv esi
	mov eax, edx
kraj:
	leave
	ret

