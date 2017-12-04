.intel_syntax noprefix

.text

	.globl racunaj
#int racunaj(int, int, char) ;
#eax         edi  esi  dl
racunaj:
	enter 0,0
	cmp dl, '+'
	je plus
	cmp dl, '-'
	je minus
	cmp dl, '*'
	je puta
	cmp dl, '/'
	je podeli
	cmp dl, '%'
	je ostatak
	jmp kraj
plus:
	mov eax, edi
	add eax, esi
	jmp kraj
minus:
	mov eax, edi
	sub eax, esi
	jmp kraj
puta:
	movsx rax, edi
	#movsx rsi, esi
	imul esi 
	jmp kraj
podeli:
	movsx rax, edi
	cdq
	idiv esi
	jmp kraj
ostatak:
	movsx rax, edi
	cdq
	idiv esi
	mov eax, edx
	jmp kraj
kraj:
	leave
	ret

