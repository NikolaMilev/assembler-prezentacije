.intel_syntax noprefix

.text
.globl faktorijel
# long faktorijel(unsigned) ;
#  rax                 rdi
faktorijel:
	enter 0,0
	mov rax, 1
petlja:
	test rdi, rdi
	jz kraj
	xor rdx, rdx
	mul rdi
	dec rdi
	jmp petlja 
kraj:
	leave
	ret
