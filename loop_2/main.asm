global main
extern printf, scanf

section .data
  msg: db "Enter number: ", 0
  format_printf: db "Looping %llu out of %llu", 10, 0
  format_scanf: db "%llu"

section .text
main:
  push rbp
  mov rbp, rsp
  sub rsp, 16
  
  lea rdi, [msg]
  xor rax, rax
  call printf

  lea rdi, [format_scanf]
  lea rsi, QWORD [rbp-8]
  xor rax, rax
  call scanf

  mov rax, QWORD [rbp-8]
  mov QWORD [rbp-16], rax

loop:
  lea rdi, [format_printf]
  mov rsi, QWORD [rbp-16]
  mov rdx, QWORD [rbp-8]
  xor rax, rax
  call printf

  dec QWORD [rbp-16]
  jnz loop

  leave
  ret
