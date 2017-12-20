.intel_syntax noprefix

.text
.globl skalarni_proizvod
# long skalarni_proizvod(long a[], long b[], int n);
#  rax                        rdi       rsi    edx

skalarni_proizvod:
	enter 0,0
	mov edx, edx
	lea r8, [rdi + 8*rdx - 8]
	xor rcx, rcx
petlja:
	cmp rdi, r8
	ja kraj

	mov rax, [rdi]
	mov rbx, [rsi]
	xor rdx, rdx
	imul rbx
	add rcx, rax

	add rdi, 8
	add rsi, 8
	jmp petlja
kraj:
	mov rax, rcx
	leave
	ret

