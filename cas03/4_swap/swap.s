.intel_syntax noprefix

.text

.globl swap

# void swap(int*, int*) ;
#           rdi   rsi
# nezavisno od tipa podataka,
# pokazivaci (adrese) se posmatraju kao celobrojni
# podaci; posto su adrese, salju se osmobajtne vrednosti

swap:
	enter 0,0
	# mov ne dozvoljava da oba operanda budu memorijska
	# stoga moramo da izvrsimo zamenu u 4 instrukcije
	mov ecx, [rdi]
	mov edx, [rsi]
	mov [rdi], edx
	mov [rsi], ecx
	leave
	ret
