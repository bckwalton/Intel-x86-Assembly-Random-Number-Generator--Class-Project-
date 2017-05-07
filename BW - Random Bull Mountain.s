        .intel_syntax noprefix
        .section .data
iter:	.quad 0
zero:	.quad 0
one:	.quad 1
two:	.quad 2
txt:	.string "Random - Bull Mountain[64 bit]: %d\n"
        .text
        .section .rodata
        .globl main
        .type main, @function

main:
	push rbp
	mov rax, zero
loop1:
	RDRAND rsi
	SHR rsi, 62
	mov rdi, OFFSET FLAT:txt
	cmp rsi, two
	jg loop1
loop2:
	mov rdi, OFFSET FLAT:txt
	lea rax, iter
	call printf
	lea rax, iter
	add QWORD PTR[rax], 1
	cmp QWORD PTR[rax], 20
	jl  loop1
	ret
