.intel_syntax noprefix


.text
.globl savrsen_stepen
#int savrsen_stepen(unsigned n, unsigned* m, unsigned* k);
#eax                     edi         rsi          rdx

# trazimo brojeve m i k takve da m^k=n
# dato nam je samo n
# k >= 2 i m >= 2
#ideja:
# for(*m = 2; *m <= n/2; (*m)++)
# {
# 	stepen = *m;
# 	while(stepen < n)
# 	{
# 		stepen *= *m;
# 		(*k)++;
# 	}
# 	if(n == stepen)
# 		return 1;
# }
# return 0;


savrsen_stepen:
	enter 0,0
	# upisujemo u *m 2
	mov [rsi], dword ptr 2
	# upisujemo u *k 2
	mov [rdx], dword ptr 2
	# racunamo n/2 i smestamo u ecx
	mov ecx, edi
	shr ecx, 1
spoljasnja:
	# uslov petlje je da *m <= n/2
	# ukoliko nije tacan, skacemo na kraj
	# i znamo da n nije savrsen stepen nekog broja 
	cmp [rsi], ecx
	ja nije
	# inace, u r8d upisujemo trenutni stepen, (*m) ^ (*k), odnosno (*m) ^ 2
	mov eax, [rsi]
	# pamtimo rdx jer ce se on izmeniti instrukcijom mul
	push rdx
	mul dword ptr [rsi]
	pop rdx
	# upisujemo (*m) ^ (*k), odnosno (*m) ^ 2 u r8d
	mov r8d, eax
unutrasnja:
	# uslov unutrasnje petlje je da je (*m) ^ (*k) < n
	cmp r8d, edi
	# ukoliko je (*m) ^ (*k) = n, tada smo nasli par koji nas zanima
	je jeste
	# ukoliko je (*m) ^ (*k) > n, povecavamo *m, upisujemo u *k 2 i idemo dalje
	ja priprema_spoljasnja
	# inace, mnozimo 
	# kako je u rdx treci argument, cuvamo ga
	push rdx
	mov eax, r8d
	mul dword ptr [rsi]
	pop rdx
	mov r8d, eax
	inc dword ptr [rdx]
	jmp unutrasnja

priprema_spoljasnja:
	# vrednost iz *m povecavamo za 1 a iz *k stavljamo na 2
	inc dword ptr [rsi]
	mov dword ptr [rdx], 2
	# skacemo na spoljasnju petlju
	jmp spoljasnja

nije:
	# ukoliko ne vazi da n = (*m) ^ (*k), samo pisemo 0 u eax i zavrsavamo
	xor eax, eax
	jmp kraj
jeste:
	# ukoliko vazi da n = (*m) ^ (*k), te vrednosti su na odgovarajucim adresama
	# i samo pisemo 1 u eax i zavrsavamo
	mov eax, 1
kraj:
	leave
	ret

