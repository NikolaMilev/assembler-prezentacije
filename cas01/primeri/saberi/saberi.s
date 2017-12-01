# komentari pocinju simbolom # i vaze do kraja reda

# koristimo intelovu neprefiksnu sintaksu
.intel_syntax noprefix

# pocinjemo sekciju koda
.text
	# Naznacavamo da je simbol simbol globalni.
	# Neophodno je da simbol saberi bude globalni kako bi linker mogao da ga 
	# nadje i zavrsi posao povezivanja koda.
	
	.globl saberi

# funkcija saberi 
# stavljamo labelu pre pocetka kako bismo mogli da pozovemo
saberi:
	# epilog funkcije
	# enter n, 0 koristicemo umesto:
	#
	# push rbp
	# mov rbp, rsp
	# sub rsp, n
	#
	# Pamtimo pokazivac na okvir steka prethodne funkcije.
	# Kao trenutni pokazivac na okvir steka postavljamo pokazivac
	# na trenutni vrh steka i umanjujemo pokazivac na vrh steka za n, 
	# sto znaci da odvajamo n bajtova za lokalne promenljive.
	enter 0,0

	#premestamo sadrziaj registra edi u registar eax
	#edi i eax su donjih 4 bajta registara rdi i rax, redom
	mov eax, edi
	# Sabiramo sadrzaje registara eax i esi, upisujuci rezultat 
	# u registar eax.
	# Kada koristimo Intelovu sintaksu, prvi operand je onaj
	# u koji upisujemo rezultat (ukoliko sama instrukcija funkcionise
	# tako sto rezultat upisuje u jedan od operanada).
	# Opsti oblik instrukcije koja ima dva operanda zbog ovoga je
	# kod dst, src
	# kod oznacava kod instrukcije, dat simbolicki
	# dst - skracenica od destination
	# src - skraceno od source; nije nuzno izvor podataka
	add eax, esi
	# prolog
	# ekvivalentno:
	#
	# mov rsp, rbp
	# pop rbp
	#
	# Znacenje ovog dela jeste dealociranje lokalnih promenljivih i vracanje
	# steka u stanje kao sto je bilo na pocetku funkcije (pre enter 0, 0 instrukcije)
	leave
	# kontrolu prepustamo pozivajucoj funkciji
	ret
	