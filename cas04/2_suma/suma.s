.intel_syntax noprefix

.text

.globl suma

# int suma(int[], int) ;
# eax        rdi  esi

suma:
	enter 0,0
	xor eax, eax
	xor rcx, rcx
petlja:
	cmp ecx, esi
	jge kraj
	add eax, [rdi+4*rcx]
	inc ecx
	jmp petlja

kraj:
	leave
	ret
