global  _main
extern  _printf
extern _exit

section .data
num1: dd 10
num2: dd 23
message: db 'Il risultato %d'

section .bss

section .text
_main:
	nop
	mov eax, dword[ num1 ]
	mov ebx, dword[ num2 ]
    add eax, ebx
	push eax
	mov ecx, message
    push ecx
    call _printf
    add esp, 8
	push 0
	call _exit
	ret
