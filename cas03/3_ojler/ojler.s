.intel_syntax noprefix

.text
.globl ojler

# funkcija nzd sa ovog casa
nzd:
	enter 0,0
	cmp edi, esi
	jge petlja_nzd
	mov ecx, edi
	mov edi, esi
	mov esi, ecx
petlja_nzd:
	test esi, esi
	jz kraj_nzd
	mov eax, edi
	xor edx, edx
	div esi
	mov edi, esi
	mov esi, edx
	jmp petlja_nzd
kraj_nzd:
	mov eax, edi
	leave
	ret

# unsigned ojler(unsigned) ;
#      eax            edi
# Ojlerova funkcija broja n oznacava broj brojeva
# strogo manjih od n koji su uzajamno prosti sa n
# koristicemo cinjenicu da su brojevi uzajamno prosti
# akko im je nzd 1
# ideja
# ojler_brojac = 0
# ojler_trenutni = 1
# while(ojler_trenutni < n)
# {
# 	if(nzd(n, ojler_trenutni) == 1)
# 	{
# 		ojler_brojac++;
# 	}
# 	ojler_trenutni++;
# }
ojler:
	enter 0,0
	# u ecx cuvamo broj do kog smo stigli
	mov ecx, 1
	# u r8d cuvamo broj brojeva a manjih od n
	# za koje vazi nzd(n, a) == 1
	mov r8d, 0
petlja_ojler:
	cmp edi, ecx
	jng kraj_ojler
	# kako r8 i rcx pripadaju pozvanoj funkciji, moracemo da ih cuvamo na steku pre poziva
	# isto vazi za rdi, parametar prosledjen funkciji
	push rdi
	push r8
	push rcx
	# da bi adresa u rsp bila deljiva sa 16
	sub rsp, 8
	# u edi se vec nalazi broj n
	# u esi smestamo trenutni broj do kog smo stigli
	mov esi, ecx
	call nzd
	# uvecavamo stek za 8 i skidamo registre u obrnutom poretku
	# od onog u kom smo ih stavili
	add rsp, 8
	pop rcx
	pop r8
	pop rdi
	# proveravamo da li je nzd 1
	cmp eax, 1
	je uvecaj
# ovde cemo uvecati trenutni broj i skociti na adresu koju predstavlja labela petlja_ojler 
# tj. skacemo na pocetak petlje
spremi_sledecu_iteraciju:
	inc ecx
	jmp petlja_ojler
# uvecavamo broj uzajamno prostih sa nasim brojem
uvecaj:
	inc r8d
	jmp spremi_sledecu_iteraciju

kraj_ojler:
	# smestamo rezultat u eax
	# i zavrsavamo funkciju
	mov eax, r8d
	leave
	ret

