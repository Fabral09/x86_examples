.section .data

.equ LINUX_SYS_CALL, 0x80

output:
 .ascii "The processor vendor ID is 'xxxxxxxxxxxx'\n"
 # Questa stringa verrà usata per la stampa tramite printf

output2:
 .asciz "The processor vendor ID is '%s'\n"

comando:
 .asciz "echo SALVE!"

.section .bss

 .lcomm buffer, 12
 .lcomm numero, 4

.section .text

.globl _start

_start:
 movl $0, %eax
 cpuid
 movl $output, %edi
 movl %ebx, 28(%edi)
 movl %edx, 32(%edi)
 movl %ecx, 36(%edi)
 movl $4, %eax
 movl $1, %ebx
 movl $output, %ecx
 movl $42, %edx
 int $LINUX_SYS_CALL 
 movl $0, %eax
 cpuid
 movl $buffer, %edi
 movl %ebx, (%edi)
 movl %edx, 4(%edi)
 movl %ecx, 8(%edi)
 pushl $buffer
 pushl $output2
 call printf
 addl $8, %esp
 pushl $comando
 call system
 addl $8, %esp
 #pushl $0
 #call exit
 movl $numero, %edi
 movl $10, (%edi)
 movl $1, %eax
 movl $0, %ebx
 int $LINUX_SYS_CALL
