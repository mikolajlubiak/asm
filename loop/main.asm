				; int main();
global main
				; #include <stdio.h>
extern printf, scanf

section .text
				; int main()
main:
				; {
	push rbp
	mov rbp, rsp

				; __int128 i; // or int i[4];
	sub rsp, 16		; allocates 16 bytes on the stack

				; printf(msg);
	mov eax, 0
	lea rdi, [msg]
	call printf
	; mov rax, 1
	; mov rdi, 1
	; mov rsi, msg
	; mov rdx, msgLen
	; syscall

				; scanf(format, &number);
	mov eax, 0
	lea rdi, [format]
	lea rsi, [number]	; then rdx, rcx...
	call scanf


				; i=0;
	mov DWORD [rbp-4], 0

				; do {
loop:

				; printf(msg2, i, number);
	mov edx, [number]
	mov rsi, [rbp-4]
	lea rdi, [msg2]
	mov eax, 0
	call printf

				; i++;
	mov ecx, DWORD [number]
	inc DWORD [rbp-4]

				; } while (i < number);
	cmp [rbp-4], ecx
	jle loop

				; }
	add rsp, 16
	mov rsp, rbp
	pop rbp
	ret

section .data
				; char* msg = "Enter number: \0";
	msg: db "Enter number: ", 0 ; (0 -> \0) 
				; char* msg2 = "Looping %d out of %d\n\0";
	msg2: db "Looping %d out of %d", 10, 0 ; (10 -> \n, 0 -> \0)
				; char* format = "%d";
	format: db "%d"

section .bss
				; int32_t number;
	number: resb 4		; 4 bytes (32 bits)
