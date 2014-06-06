section .data
 messaggio: db 'Hello world', 0x0A
 misuraMessaggio: equ $-messaggio
 messaggio2: db 'Ciao', 0x0A
 misuraMessaggio2: equ $-messaggio2

section .text
global _start
_start:
 nop
 mov eax, 4
 mov ebx, 1
 push eax
 mov eax, 5
 cmp eax, 9
 jnz italiano

inglese: 
 mov ecx, messaggio
 mov edx, misuraMessaggio
 jmp fine

italiano:
 mov ecx, messaggio2
 mov edx, misuraMessaggio2

fine:
 pop eax
 int 80h
 mov eax, 1
 mov ebx, 0
 int 80h
  
