section .bss				; changing data
		; int64_t someData;
	someData: resb 8		; reserve 8 bytes (64 bits, just enough for rax)

section .data				; constant data
		; string hello = "Hello, world!\n";
	hello: db "Hello, world!", 10	; "Hello, world!\n" (10 -> \n)
		; unsigned int helloLen = strlen(hello);
	helloLen: equ $-hello		; len(hello), eval (equ) current position ($) minus (-) hello address (hello)


section .text				; code/instructions
	global _start

_start:
		; puts(hello);
	mov rax, 1			; syscall write
	mov rdi, 1			; write to stdout
	mov rsi, hello			; address of hello
	mov rdx, helloLen		; num of bytes to print (how long to go)
	syscall				; write

		; someData = 2137;
	mov rax, 2137			; move 2137 into rax (eax, but 64 bits)
	mov [someData], rax		; move rax into someData value (not address)

		; return 0;
	mov rax, 60			; syscall exit
	mov rdi, 0			; status code success
	syscall				; exit
