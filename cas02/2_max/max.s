.intel_syntax noprefix

.text
.globl maksimum
# int maksimum(int a, int b) ;
maksimum:
	enter 0,0
	cmp edi, esi
	jng drugi
	mov eax, edi
	jmp kraj
drugi:
	mov eax, esi
kraj:
	leave
	ret

