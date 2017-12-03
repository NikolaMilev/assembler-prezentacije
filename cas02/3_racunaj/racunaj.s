.intel_syntax noprefix

.data
.text
	.globl racunaj

#	int racunaj(int a, int b, char op) ;
#	eax			edi	   esi    dl
racunaj:
	enter 0,0
	mov eax, -1
	cmp dl, '+'
	je saberi
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
	mov eax, edi
	add eax, esi
	jmp kraj
oduzmi:
	mov eax, edi
	sub eax, esi
	jmp kraj
pomnozi:
	mov eax, edi
	cdqe
	cdq
	imul esi
	jmp kraj
podeli:
	mov eax, edi
	cdqe
	cdq
	idiv esi
	jmp kraj
ost:
	mov eax, edi
	cdqe
	cdq 
	idiv esi
	mov eax, edx
kraj:
	leave
	ret

