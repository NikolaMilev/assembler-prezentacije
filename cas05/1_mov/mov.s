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
	# isti efekat imali bismo instrukcijom 
	# jer kopiramo niza 4 bajta dok se u visa
	# 4 bajta upisuje 0
	# mov eax, edi
	leave
	ret

