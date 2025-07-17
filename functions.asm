; int strlen(String message)
strlen:
    push rsi ; push current value of rsi onto stack ready to restore after subroutine is complete
    mov rsi, rax

nextchar: 
    cmp byte [rax], 0 ; compare the byte to 0
    jz finished ; if 0 then jump to finished
    inc rax ; otherwise increment rax by one byte
    jmp nextchar ; repeat until 0 is reached (end of line)

finished:
    sub rax, rsi
    pop rsi ; restore original value of rsi before subroutine from stack
    ret

; void sprint(String message)
sprint:
    push rdx
    push rsi
    push rdi
    push rax
    call strlen

    mov rdx, rax ; now move value from rax into rdx ready for write system call (rdx in this case is used to specify length of string we want to write)
    pop rax
    mov rdi, 1  ; specify we want to write to stdout
    mov rsi, rax ; put the message we want to write into rsi
    mov rax, 0x2000004 ; specify what syscall we want to call (write in this case)
    syscall

    pop rdi
    pop rsi
    pop rdx
    ret

; void sprintLF(String message)
; print with linefeed
sprintLF:
    call sprint

    push rax
    mov rax, 0Ah

    push rax

    mov rax, rsp
    call sprint
    pop rax
    pop rax
    ret

; void exit()
quit:
    mov rax, 0x2000001
    mov rdi, 0
    syscall


