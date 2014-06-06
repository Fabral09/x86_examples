; "Hello World!" in 32 bit Linux NASM
; adapted from http://asm.sourceforge.net/intro/hello.html by Mark Loiseau
; referenced in http://blog.markloiseau.com/2012/04/hello-world-NASM-Linux
; Assemble with nasm -f elf -g -o hello.o hello.asm 
; Link ld -o hello hello.o 

section .data

section .bss
    num1: resd 1
    num2: resd 1
    
global _start
 
section .text
_start:
    nop
    mov dword [num1], 3
    mov eax, dword [num1]
    mov dword [num2], eax
    mov eax, 1        ; sys_exit syscall
    mov ebx, 0        ; return 0 (success)
    int 80h


    
