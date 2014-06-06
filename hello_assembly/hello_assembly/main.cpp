#include <iostream>
#include <cstdlib>

using namespace std;

extern "C"
{
	int foo( int n1, int n2 ); // written in assembly!
	void foo2( int n1, int n2, int * result ); // written in assembly!
}

int main() 
{
	setlocale(LC_ALL, "italian");
	cout << "Foo returns " << foo( 3, 6 ) << "\n";
	int n1 = 17, n2 = 90;
	int result = 0;
	foo2( n1, n2, &result );
	cout << "Il risultato è: " << result << endl; 
	system("pause");
	int numero1 = 9, numero2 = 5, numero3 = 0;
	__asm
	{
		nop
		mov eax, [numero1]
		mov ebx, [numero2]
		add eax, ebx
		mov [numero3], eax
	}
	cout << "Il numero 3 è: " << numero3 << endl; 
	system("pause");

	int n4 = 0;
/*
	__asm
	{
		mov edx, 0
Label1:
		inc edx
		mov [n4], edx
		cmp edx, 1000
		je OutLoop
		jmp Label1
OutLoop:		
	}
*/
	__asm
	{
		mov edx, 1000
Label1:
		dec edx
		mov [n4], edx
		jnz Label1		
	}

	cout << "N4 vale " << n4 << endl;

	bool valoreBool;

	__asm
	{
		mov [valoreBool], 1
	}

	cout << "Valore bool : " << valoreBool << endl;
	system( "pause" );
	return 0;
}