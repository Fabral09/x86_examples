; ----------------------------------------------------------------------------
; helloworld.asm
;
; This is a Win32 console program that writes "Hello, World" on one line and
; then exits.  It needs to be linked with a C library.
; Assemble with nasm -f win32 -o hello.obj hello.asm
; Link with link hello.obj libcmt.lib
; ----------------------------------------------------------------------------

global  _main
extern  _printf
		
section .data
message: db 'Hello, World', 10, 0

section .text
_main:
        push message
        call _printf
        add esp, 4
        ret


		
