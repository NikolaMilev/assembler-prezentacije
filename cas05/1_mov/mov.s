.intel_syntax noprefix

.text
.globl foo1
.globl foo2

# long foo1(long) ;
#  rax       rdi
foo1:
	enter 0,0
	# samo prepisujemo argument
	mov rax, rdi
	leave
	ret


# long foo2(long) ;
#  rax       rdi
foo2:
	enter 0,0
	# kopiramo sadrzaj edi u sebe samog
	# pri kopiranju, visi bajtovi registra
	# rdi bice postavljeni na 0
	mov edi, edi
	mov rax, rdi
	leave
	ret

