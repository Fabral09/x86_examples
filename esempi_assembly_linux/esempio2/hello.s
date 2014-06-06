.section .data
messaggio:
 .asciz "Ciao dal programma\n"
comando:
 .asciz "echo COME VA?"
uguali:
 .asciz "Sono uguali!\n"
diversi:
 .asciz "Sono diversi!\n"
mostraRisultato:
 .asciz "Il risultato è %d\n"
num1:
 .int 20
num2:
 .int 50
numeroInput:
 .int 0
stringaInput:
 .asciz "%d"
stringaValoreIncrementato:
 .asciz "Il valore incrementato è %d\n"
risultato:
 .int 0

.section .bss

.section .text
.globl _start

_start:
 pushl $messaggio
 call printf
 addl $8, %esp 
 pushl $comando
 call system
 addl $8, %esp
 mov $9, %eax
 mov $4, %ebx
 cmp %eax, %ebx
 jnz sono_diversi

sono_uguali:
 pushl $uguali
 call printf
 jmp termine_programma

sono_diversi:
 pushl $diversi
 call printf

termine_programma:
 movl num1, %eax
 movl num2, %ebx
 addl %ebx, %eax
 movl %eax, risultato
 pushl risultato
 pushl $mostraRisultato
 call printf
 addl $8, %esp
 pushl $numeroInput
 pushl $stringaInput
 call scanf
 movl numeroInput, %eax
 inc  %eax
 pushl %eax
 pushl $stringaValoreIncrementato
 call printf
 addl $8, %esp 
 pushl $0
 call exit
