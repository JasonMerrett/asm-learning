global _main

section .data

msg: 
default rel
    db 'Hello, world', 10

section .text
_main:
    lea rax, [msg] ; set rax equal to the address of msg
    mov rsi, rax ; set rsi equal to rax ready for pointer arithmatic later

nextchar: 
    cmp byte [rax], 0 ; compare the byte to 0
    jz finished ; if 0 then jump to finished
    inc rax ; otherwise increment rax by one byte
    jmp nextchar ; repeat until 0 is reached (end of line)

finished:
    sub rax, rsi ; subtract address in rsi from rax to get the difference in bytes
    mov rdx, rax ; now move value from rax into rdx ready for write system call (rdx in this case is used to specify length of string we want to write)
    mov rdi, 1  ; specify we want to write to stdout
    lea rsi, [msg] ; put the message we want to write into rsi
    mov rax, 0x2000004 ; specify what syscall we want to call (write in this case)
    syscall

    mov rax, 0x2000001 ; now call the exit syscall
    mov rdi, 0
    syscall