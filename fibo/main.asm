global main
extern printf

section .text
main:
	push rbx

	mov rcx, 64
	xor rax, rax
	mov rbx, 1

loop:
	push rax
	push rcx

	lea rdi, [format]
	mov rsi, rbx
	call printf

	pop rcx
	pop rax

	mov rdx, rbx
	add rbx, rax
	mov rax, rdx

	dec rcx
	jnz loop

	pop rbx
	ret
	

section .data:
	format: db "%ld", 10, 0
