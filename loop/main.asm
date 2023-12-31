global main
extern printf, scanf

section .text
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16		; allocates 16 bytes on the stack, the number of bytes has to be a multiple of 16

		; printf(msg);
	xor rax, rax
	lea rdi, [msg]
	call printf
	; mov rax, 1
	; mov rdi, 1
	; mov rsi, msg
	; mov rdx, MSG_LEN
	; syscall

		; scanf(format, &number);
	xor rax, rax
	lea rdi, [format]
	lea rsi, [number]
	call scanf

		; int64_t i=0;
	mov QWORD [rbp-8], 0

loop:
		; printf(msg2, i, number);
	xor rax, rax
	lea rdi, [msg2]
	mov rsi, QWORD [rbp-8]
	mov rdx, [number]
	call printf

		; i++;
	inc QWORD [rbp-8]

		; 
	mov rax, [number]
	cmp QWORD [rbp-8], rax
	jle loop

	add rsp, 16
	mov rsp, rbp
	pop rbp
	ret

section .data
		; char* msg = "Enter number: \0";
	msg: db "Enter number: ", 0 ; (0 -> \0) 
		; char* msg2 = "Looping %d out of %d\n\0";
	msg2: db "Looping %d out of %d", 10, 0 ; (10 -> \n, 0 -> \0)
		; char* format = "%d\0";
	format: db "%d", 0

section .bss
		; int64_t number;
	number: resq 1		; 8 bytes (64 bits)
