%include 'functions.asm'

global _main

section .data
message:
default rel
    db 'hello, world', 10, 0h

message2:
default rel
    db 'hello, again', 10, 0h

section .text
_main:
    lea rax, [message]
    call sprint

    lea rax, [message2]
    call sprint

    call quit