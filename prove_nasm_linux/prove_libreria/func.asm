section .data
    message: db 'Hello, world!',0x0A    ; message and newline
    length: equ $-message            ; NASM definition pseudo-instruction

section .bss

GLOBAL funzione

SECTION .text
funzione:
    push ebp
    mov eax, 4        ; sys_write syscall
    mov ebx, 1        ; stdout
    mov ecx, message    ; message address
    mov edx, length        ; message string length
    int 80h
    pop ebp
    ret 
