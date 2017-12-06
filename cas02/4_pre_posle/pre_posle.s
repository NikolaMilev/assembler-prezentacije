.intel_syntax noprefix
.text
.globl promeni

promeni:
	enter 0,0
	# citamo vrednost -13 datu neposredno i pisemo na 
	# adresu koju predstavlja labela i (videti pre_posle.c)
	# kako nijedan od operanada nije registar, nemamo 
	# poznatu velicinu operanda i onda moramo
	# eksplicitno da je navedemo
	mov [i], dword ptr -13
	leave
	ret

