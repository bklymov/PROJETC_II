; register_adder.asm - first attempt
; Porting the 68k REGISTER_ADDER subroutine to x86_64.
;
; Original 68k code was just:
;   REGISTER_ADDER:
;       ADD.L D2, D1
;       RTS
;
; For x86_64 I need to follow the System V calling convention:
;   args come in rdi and rsi, result goes in rax

section .text
    global register_adder

register_adder:
    mov     rax, rdi            ; copy first arg
    add     rax, rsi            ; add second arg
    ret
