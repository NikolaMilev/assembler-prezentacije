.intel_syntax noprefix

.text

.global min_max
# void min_max(int [], int, int*, int*) ;
#                 rdi  esi   rdx   rcx
min_max:
	enter 0,0
	mov r8d, [rdi]
	mov [rdx], r8d
	mov [rcx], r8d
	lea r9, [rdi + 4*rsi - 4]
	add rdi, 4
petlja:
	cmp rdi, r9
	ja kraj
	mov rax, [rdi]
	cmp rax, [rdx]
	jl promeni_min
	cmp rax, [rcx]
	jg promeni_max
	jmp nastavi
promeni_min:
	mov r8d, [rdi]
	mov [rdx], r8d
	jmp nastavi
promeni_max:
	mov r8d, [rdi]
	mov [rcx], r8d
nastavi:
	add rdi, 4
	jmp petlja
kraj:
	leave
	ret

