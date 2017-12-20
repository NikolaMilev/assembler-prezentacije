.intel_syntax noprefix

.text
.globl izbaci
# void izbaci(int a[], unsigned* len, unsigned ind) ;
#                 rdi            rsi           edx          
izbaci:
	enter 0,0
	cmp edx, [rsi]
	jae kraj
	mov ecx, [rsi]
	# ucitavamo adresu poslednjeg elementa niza u r9
	lea r9, [rdi + 4*rcx - 4]
	# smanjujemo duzinu niza za 1
	dec dword ptr [rsi]
	# ucitavamo adresu elementa desno od onog kog treba da izbacimo u r8
	mov edx, edx
	lea r8, [rdi+4*rdx+4]
# ideja: pomeramo sve desno od datog elementa za jedno mesto
# u levo, polazeci od prvog sledeceg
petlja:
	cmp r8, r9
	ja kraj
	mov ecx, [r8]
	mov [r8-4], ecx
	add r8, 4
	jmp petlja
kraj:
	leave
	ret

