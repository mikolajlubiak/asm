global main
extern printf

section .text
main:
	push rbp
	mov rbp, rsp

	; rcx = 64, rax = 0, rbx = 1
	mov rcx, 64
	xor rax, rax
	mov rbx, 1

loop:
	; save rax and rcx
	push rax
	push rcx

	; printf(format, rbx)
	xor rax, rax
	lea rdi, [format]
	mov rsi, rbx
	call printf

	; restore rcx and rax
	pop rcx
	pop rax

	; rdx = rbx, rbx = rbx + rax, rax = rdx
	mov rdx, rbx
	add rbx, rax
	mov rax, rdx

	; rcx = rcx - 1
	dec rcx

	; if rcx > 0
	cmp rcx, 0
	jg loop

	xor rax, rax
	leave
	ret

section .data:
	; format = "%ld\n\0"
	format: db "%ld", 10, 0
