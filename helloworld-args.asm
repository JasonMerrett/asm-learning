%include 'functions.asm'

global _main

section .text
_main:
    xor esi, esi

; TODO: still trying to figure it out, can't seem to find good resources on handling cli arguments using 86_64 assembly
nextArg:
    mov rax, [rsp+rsi*8+8]

    test rax, rax
    jz noMoreArgs
    call sprintLF
    add esi, 1 
    jmp nextArg

noMoreArgs:
    call quit