global _start

section .bss
		; int64_t someData;
	someData: resq 1

section .data
		; char* hello = "Hello, world!\n\0";
	hello: db "Hello, world!", 10, 0	; "Hello, world!\n\0" (10 -> \n, 0 -> \0)
		; int helloLen = sizeof(hello)/sizeof(hello[0]);
	helloLen: equ $-hello				; len(hello) is (equ) current position ($) minus (-) hello address (hello)

section .text
_start:
		; puts(hello);
	mov rax, 1			; syscall write
	mov rdi, 1			; write to stdout
	mov rsi, hello		; address of hello
	mov rdx, helloLen	; num of bytes to print (for how long to go)
	syscall				; write

		; someData = 2137;
	mov QWORD [someData], 2137	; move rax into someData value (not address)

		; return 0;
	mov rax, 60			; syscall exit
	mov rdi, 0			; status code success
	syscall				; exit
