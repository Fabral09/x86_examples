; "Hello World!" in 32 bit Linux NASM
; adapted from http://asm.sourceforge.net/intro/hello.html by Mark Loiseau
; referenced in http://blog.markloiseau.com/2012/04/hello-world-NASM-Linux
; Assemble with nasm -f elf -g -o hello.o hello.asm 
; Link ld -o hello hello.o 

global _start            ; global entry point export for ld
 
section .text
_start:
    nop
    mov eax, 4        ; sys_write syscall
    mov ebx, 1        ; stdout
    mov ecx, message    ; message address
    mov edx, length        ; message string length
    int 80h
    mov eax, dword [num1]
    mov ebx, dword [num2]
    mov ecx, eax
    add ecx, ebx
    mov dword [result], ecx
    ; sys_exit(return_code)
    
    mov al, byte [mioByte]
    mov ah, byte [mioByte2]
    mov eax, 1        ; sys_exit syscall
    mov ebx, 0        ; return 0 (success)
    int 80h

section .bss
    result: resd 1
    
section .data
    message: db 'Hello, world!',0x0A    ; message and newline
    length: equ $-message            ; NASM definition pseudo-instruction
    num1: dd 10
    num2: dd 20
    mioByte: db 255
    mioByte2: db 255