.intel_syntax noprefix

.text

.globl suma

# int suma(int[], int) ;
# eax        rdi  esi
# indeksni pristup: vrednost iz ecx (koristimo rcx kako bismo imali adrese jednakih sirina prilikom
# racunanja memorijskog operanda) koristicemo kao indeks u petlji
# ta vrednost prosetace se od 0 do esi-1 (tj. do vrednosti zapisanoj u esi registru umanjenoj za 1)
# tada znamo da smo prosli sve clanove niza
# [B + S*I] omogucuje nam pristup I-tom elementu niza koji pocinje na adresi B i kom je svaki
# element velicine S (naravno, indeksiranje ovde pocinje od 0)

# drugi pristup, preko adresa, moze se naci u primeru 3 sa ovog casa
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
	# iako koristimo rcx, necemo imati dovoljno velike nizove
	# da nam ovo napravi problem
	inc ecx
	# skacemo na sledecu iteraciju
	jmp petlja

kraj:
	leave
	ret
