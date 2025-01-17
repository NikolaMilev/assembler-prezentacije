# ponovljen primer sa main funkcijom s prethodnog casa
# radi razjasnjenja razlika izmedju mov i lea instrukcija
.intel_syntax noprefix

.data
	form1: .asciz "%d %d"
	form2: .asciz "Zbir: %d\n"

.text
	.globl main

#ista funkcija kao na prvom casu
saberi:
	enter 0,0
	mov eax, edi
	add eax, esi
	leave
	ret

main:
# odvajamo 8 bajtova za lokalne promenljive
	enter 8,0
# da bi adresa vrha steka bila deljiva sa 16 a mi smo dodali 8, moramo dodati jos 8 bajtova na stek
	sub rsp, 8
# mozemo i:
	# xor rsp, 0xfffffffffffffff0
	# tj. 
	# xor rsp, -16
	# ova instrukcija ce smanjiti vrednost rsp za najvise 15 bajtova i poravnace ga sa 16
	# na ovaj nacin ne moramo da razmisljamo koliko smo bajtova pre ovoga stavili na stek
	# ovo ima i losu stranu: ukoliko smo stavljali podatke na stek, nismo sigurni da ce
	# skidanje podataka biti ispravno

	# lea rdi, form1 ucitava 8-bajtnu adresu koju predstavlja labela form1
	# kada bismo napisali mov rdi, form1, tada bi se sa adrese koju predstavlja labela form1
	# ucitalo 8 bajtova (toliki je prvi operand) a to ne zelimo!
	lea rdi, form1
	# drugi operand lea instrukcije posmatra se kao adresa i ne cita se vrednost sa nje
	# vec se direktno radi sa tom adresom
	lea rsi, [rbp-4]
	lea rdx, [rbp-8]
	mov rax, 0
	call scanf

	# kada je drugi operand mov instrukcije adresa, radi se sa vrednoscu koja se nalazi na toj
	# adresi (nalik na dereferenciranje)
	mov edi, [rbp-4]
	mov esi, [rbp-8]
	call saberi

	lea rdi, form2
	mov esi, eax
	mov rax, 0
	call printf

	# stavljamo 0 u eax registar
	# (return 0 na kraju main funkcije)
	xor eax, eax
	leave
	ret

	