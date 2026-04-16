; main.asm - v1: basic version, no loop yet
; Just reads two numbers, adds them, and prints the result.
; Wanted to get the I/O working first before adding the loop.
;
; This replaces the 68k TRAP #15 I/O with printf/scanf.

section .data
    prompt_str:     db  "Enter number: ", 0
    result_fmt:     db  "The sum is: %ld", 10, 0
    str_fmt:        db  "%s", 0
    int_read_fmt:   db  " %ld", 0

section .bss
    input_buf:      resq 1

section .text
    global  main
    extern  printf, scanf, fflush
    extern  register_adder

main:
    push    rbp
    mov     rbp, rsp
    push    r13                     ; will hold first number
    push    r14                     ; will hold second number

    ; read first number
    lea     rdi, [str_fmt]
    lea     rsi, [prompt_str]
    xor     eax, eax
    call    printf

    xor     edi, edi
    call    fflush

    lea     rdi, [int_read_fmt]
    lea     rsi, [input_buf]
    xor     eax, eax
    call    scanf

    mov     r13, [input_buf]        ; save first number

    ; read second number
    lea     rdi, [str_fmt]
    lea     rsi, [prompt_str]
    xor     eax, eax
    call    printf

    xor     edi, edi
    call    fflush

    lea     rdi, [int_read_fmt]
    lea     rsi, [input_buf]
    xor     eax, eax
    call    scanf

    mov     r14, [input_buf]        ; save second number

    ; add them using the subroutine
    mov     rdi, r14
    mov     rsi, r13
    call    register_adder

    ; print result
    lea     rdi, [result_fmt]
    mov     rsi, rax
    xor     eax, eax
    call    printf

    ; done
    xor     eax, eax
    pop     r14
    pop     r13
    pop     rbp
    ret
