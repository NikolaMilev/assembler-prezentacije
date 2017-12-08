.intel_syntax noprefix

.data
.text
	.globl racunaj

#	int racunaj(int a, int b, char op) ;
#	eax			edi	   esi    dl
# kako kao treci argument prosledjujemo char, dovoljno je da posmatramo
# najnizih 8 bitova (1 bajt, sto je velicina char podatka) registra rdx, odnosno dl
# pretpostavka je da ce funkciji biti prosledjen tacno jedan od karaktera
# +, -, *, / ili % kao treci argument
racunaj:
	enter 0,0
	# poredimo sadrzaj registra dl sa karakterom +
	cmp dl, '+'
	# ukoliko su jednaki, skacemo na adresu koju predstavlja
	# labela saberi
	je saberi
	# ukoliko nisu jednaki, nastavljamo dalje (dakle, u slucaju da su
	# razliciti, nema skoka)
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
	mov eax, edi
	# vrsimo oznaceno mnozenje i skacemo na kraj programa
	# kod mnozenja, u slucaju osmobajtnih podataka, 
	# mnozimo sadrzaj registra rax sa operandom instrukcije
	# i rezultat smestamo u  rdx:rax
	# ako je operand 4 bajta sirok, kao sto je ovde slucaj, tada
	# se sadrzaj registra eax mnozi sa operandom i rezultat se smesta u 
	# edx:eax
	# kako je povratni tip oznacen cetvorobajtni podatak, gornju polovinu
	# rezultata zanemarujemo (jer je sa ovim potpisom funkcije ne mozemo vratiti)
	# pa ovde nije potrebno nista prosirivati
	imul esi
	jmp kraj
podeli:
	mov eax, edi
	# cdq oznaceno prosiruje eax na edx:eax
	# kako radimo sa cetvorobajtnim oznacenim podacima (int), to je ono sto nam treba
	cdq
	# pri oznacenom deljenju, ukoliko je operand sirine 8 bajtova, sadrzaj registara rdx:rax deli se operandom
	# kolicnik se nalazi u rax a ostatak u rdx
	# ukoliko je operand cetvorobajtni, kao sto je ovde slucaj,
	# tada se sadrzaj edx:eax deli operandom i kolicnik ostaje u eax
	# a ostatak u edx 
	idiv esi
	jmp kraj
ost:
	# slicno kao za deljenje s tim sto uzimamo edx jer se u edx nalazi ostatak pri deljenju
	mov eax, edi
	cdq 
	idiv esi
	mov eax, edx
kraj:
	leave
	ret

