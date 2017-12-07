.intel_syntax noprefix

.text
.globl prost

# int prost(unsigned) ;
# eax            edi

# ideja:
# i = 2
# while(i <= n / 2)
# {
# 	if(n % i == 0)
#  	{
#  		return 0 ;
#  	}
# }
# return 1;
# domaci: implementirati efikasniju proveru, 
# odnosno i = 2, ..., sqrt(n)
# napomena: neophodno je implementirati funkciju za trazenje korena

prost:
	enter 0,0
	# u ecx smestamo brojac
	mov ecx, 2
	# u r8 smestamo n / 2
	mov r8d, edi
	# siftovanje u desno za jedno mesto ekvivalentno je 
	# deljenju sa 2
	shr r8d, 1

petlja:
	cmp ecx, r8d
	jg jeste_prost

	# spremamo se za deljenje
	xor edx, edx
	mov eax, edi
	div ecx
	# proveravamo da li je ostatak 0 i, ukoliko jeste,
	# onda znamo da broj nije prost
	test edx, edx
	jz nije_prost
	inc ecx
	jmp petlja

jeste_prost:
	mov eax, 1
	jmp kraj
nije_prost:
	xor eax, eax
kraj:
	leave
	ret

