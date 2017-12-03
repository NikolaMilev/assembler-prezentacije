# ovaj fajl prevesti naredbom gcc saberi_main.s

# komentari pocinju simbolom # i vaze do kraja reda

# koristimo intelovu neprefiksnu sintaksu
.intel_syntax noprefix

# pocinjemo sekciju podataka
.data
	form1: .asciz "%d %d"  	# kreiramo ASCI nisku terminiranu nulom
							# stavljamo labelu na pocetak reda kako bismo
							# mogli da dohvatimo nisku kasnije
	form2: .asciz "Zbir: %d\n"

# pocinjemo sekciju koda
.text
	# Naznacavamo da je simbol main globalni; neophodno je da 
	# ulazna tacka u program bude globalni simbol.
	# Linker ce sve simbole koji nisu navedeni kao globlani smatrati
	# lokalnim. U slucaju prevodjenja iz vise datoteka, moramo
	# paziti na ovo.
	.globl main

# funkcija saberi 
# stavljamo labelu pre pocetka kako bismo mogli da je pozovemo
saberi:
	# epilog funkcije
	# enter n, 0 koristicemo umesto:
	#
	# push rbp
	# mov rbp, rsp
	# sub rsp, n
	#
	# pamtimo pokazivac na okvir steka prethodne funkcije
	# kao trenutni pokazivac na okvir steka postavljamo pokazivac
	# na trenutni vrh steka i umanjujemo pokazivac na vrh steka za n, 
	# sto znaci da odvajamo n bajtova za lokalne promenljive 
	enter 0,0

	#premestamo sadrziaj registra edi u registar eax
	#edi i eax su donjih 4 bajta registara rdi i rax, redom
	mov eax, edi
	# sabiramo sadrzaje registara eax i esi, upisujuci rezultat 
	# u registar eax
	# kada koristimo Intelovu sintaksu, prvi operand je onaj
	# u koji upisujemo rezultat (ukoliko sama instrukcija funkcionise
	# tako sto rezultat upisuje u jedan od operanada!)
	# opsti oblik instrukcije koja ima dva operanda zbog ovoga je
	# kod dst, src
	# kod oznacava kod instrukcije, dat simbolicki
	# dst - skracenica od destination
	# src - skraceno od source 
	add eax, esi
	# prolog
	# ekvivalentno:
	#
	# mov rsp, rbp
	# pop rbp
	#
	# znacenje ovog dela jeste dealociranje lokalnih promenljivih i vracanje
	# steka u stanje kao sto je bilo pre poziva funkcije
	leave
	# kontrolu prepustamo pozivajucoj funkciji
	ret

# labelom main oznacavamo pocetak main funkcije
# kao sto smo u C-u imali obaveznu int main() funkciju
# u asemblerskom programu moramo imati globalnu labelu main
# neki asembleri zahtevaju drugacije ime ulazne funkcije
main:
	# epilog
	enter 8, 0
	# pri call instrukciji, na stek se stavlja osmobajtna povratna adresa
	# pri enter n, 0 instrukciji, na stek se stavlja stari okvir steka (8 bajtova)
	# i jos n za lokalne promenljive
	# dakle, ukoliko je vrh steka bio deljiv sa 16 pre call instrukcije,
	# nakon nje (tj. posle enter n, 0 instrukcije u pozvanoj funkciji) imamo jos 16 + n bajtova na steku
	# zbog ovoga je neophodno da ili n bude deljivo sa 16 ili da dodamo koliko bajtova je neophodno
	# da bi adresa sadrzana u rsp bila deljiva sa 16
	
	# rcx stavljamo na stek jer cemo imati pozive funkcija
	# a svi pozivi funkcija zahtevaju da adresa vrha steka
	# bude deljiva sa 16
	# umesto rcx smo mogli da napisemo
	# sub rsp, 8
	push rcx
	# pripremamo registre za poziv funkcije scanf
	# ucitavamo adresu koju oznacava labela form1
	# u registar rdi
	lea rdi, form1
	# pamtimo vrednost registra rbp u rcx registru
	# tj. pamtimo pokazivac (adresu) na okvir steka
	mov rcx, rbp
	# umanjujemo za 4 da bismo dobili adresu prve lokalne
	# promenljive od 4 bajta
	sub rcx, 4
	# cuvamo tu adresu u registru rsi
	mov rsi, rcx
	# ponovo smanjujemo kako bismo dobili adresu druge promenljive
	sub rcx, 4
	# pamtimo adresu u registru rdx
	mov rdx, rcx
	# pisemo 0 u rax: pri pozivu funkcija sa promenljivim brojem
	# argumenata (kao sto su scanf i printf), u rax registru
	# prenosi se broj argumenata u pokretnom zarezu
	# u nasem slucaju, to je 0
	mov rax, 0
	# poziv funkcije scanf
	call scanf

	# u registar edi ucitavamo vrednost koja se nalazi na
	# adresi rbp-4
	mov edi, [rbp-4]
	# u registar esi ucitavamo vrednost koja se nalazi na
	# adresi rbp-8
	mov esi, [rbp-8]
	# pozivamo nasu funkciju
	call saberi

	# pripremamo se za poziv funkcije printf
	# ucitavamo adresu koju oznacava labela form2 u registar rdi
	lea rdi, form2
	# u esi registar smestamo vrednost iz registra eax
	mov esi, eax
	
	# isto kao za scanf
	mov rax, 0

	# pozivamo funkciju printf
	call printf

	# stavljamo 0 u registar koji sluzi za prenosenje povratne vrednosti
	# moguce i xor rax, rax jer xor necega sa samim sobom uvek daje 0
	mov rax, 0
	# cistimo za sobom
	# iako imamo naredbu push rcx pri pocetku, kako nije neophodno da pamtimo
	# vrednost rcx pri izlasku iz funkcije, ne moramo je vratiti
	# deo steka koju koristimo u funkciji ce se ispravno isprazniti jer je leave
	# kao da smo uradili mov rsp, rbp pa pop rbp
	# i samim time je nebitno koliko smo stvari stavili na stek
	leave
	# zavrsavamo funkciju
	ret

