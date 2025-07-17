%include 'functions.asm'

global _main

section .data
message:
default rel
    db 'hello, world', 0h

message2:
default rel
    db 'hello, again', 0h

section .text
_main:
    lea rax, [message]
    call sprintLF

    lea rax, [message2]
    call sprintLF

    call quit