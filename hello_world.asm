global _main

section .data
message: 
default rel
    db 'hello, world', 10

.len: equ $ - message

section .text
_main:
    mov rax, 0x2000004
    mov rdi, 1
    lea rsi, [message]
    mov rdx, message.len
    syscall
    mov rax, 0x2000001
    mov rdi, 0
    syscall