section .data

section .bss

section .text 

global _foo
global _foo2

_foo:
 mov eax, dword[esp + 4] 
 mov ebx, dword[esp + 8]
 add eax, ebx 
 ret

_foo2:
 mov eax, dword[esp + 4] 
 mov ebx, dword[esp + 8]
 mov ecx, dword[esp + 12]
 add eax, ebx
 cmp eax, 100 
 jg Maggiore
 mov dword[ecx], eax
 jmp Fine
Maggiore:
 mov dword[ecx], 0
Fine:
 ret