.intel_syntax noprefix
.text
.globl promeni

promeni:
	enter 0,0
	mov [i], dword ptr -13
	leave
	ret

