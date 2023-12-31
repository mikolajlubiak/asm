global main
extern printf

section .text
main:
	push rbx

	; rcx = 64, rax = 0, rbx = 1
	mov rcx, 64
	xor rax, rax
	mov rbx, 1

loop:
	; save rax and rcx
	push rax
	push rcx

	; printf(format, rbx)
	lea rdi, [format]
	mov rsi, rbx
	call printf

	; restore rax and rcx
	pop rcx
	pop rax

	; rdx = rbx, rbx = rbx + rax, rax = rdx
	mov rdx, rbx
	add rbx, rax
	mov rax, rdx

	; rcx--
	dec rcx
	; if rcx is not zero
	jnz loop

	pop rbx
	ret
	

section .data:
	; format = "%ld\n\0"
	format: db "%ld", 10, 0
