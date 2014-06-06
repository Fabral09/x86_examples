
.486
.model FLAT, STDCALL
OPTION casemap:none

.DATA?
	resultString BYTE ?

.DATA
	item DD 0
	stringa BYTE 'HELLO'

.CODE

pippo PROTO :DWORD
PassaValore PROTO :DWORD
PassaValori PROTO, :DWORD, :DWORD 
ProvaMenoUno PROTO :BYTE
TestPuntatore PROTO :DWORD

start:

pippo PROC NEAR arg1:DWORD

	MOV EBX, arg1
	MOV EAX, item 
	MOV ECX, 10
StampaDiNuovo:
    ADD EAX, ECX
	DEC ECX
	JNZ StampaDiNuovo
	MOV DWORD PTR[EBX], EAX
	LEA	EAX, BYTE PTR [stringa] ;Il valore restituito dalla procedura si trova in EAX
    RET

pippo ENDP

PassaValore PROC NEAR, puntatore:DWORD
	
	MOV EAX, DWORD PTR[puntatore]
	MOV BL, BYTE PTR[EAX]
	INC BL
	MOV BYTE PTR[EAX], BL
	RET

PassaValore ENDP

PassaValori PROC, puntatore:DWORD, dimensione:DWORD
	
	MOV EAX, DWORD PTR[puntatore]
	MOV EDX, DWORD PTR[dimensione]
	MOV ECX, 0
MyLoop:
	MOV BL, BYTE PTR[EAX + ECX]
	INC BL
	MOV BYTE PTR[EAX + ECX], BL
	INC ECX
	CMP ECX, EDX
	JNE MyLoop
	RET

PassaValori ENDP

ProvaMenoUno PROC NEAR valore:BYTE
	
	MOV AL, BYTE PTR[valore]
	RET

ProvaMenoUno ENDP

TestPuntatore PROC NEAR puntatore:DWORD

	MOV EAX, puntatore
	MOV BL, BYTE PTR[EAX]
	RET

TestPuntatore ENDP

END start