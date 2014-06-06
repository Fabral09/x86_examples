#include <iostream>
#include <cstdlib>
#include <string.h>
#include <clocale>

using namespace std;

extern "C" 
{
	char * __stdcall pippo( int * );
	void __stdcall PassaValore( char * );
	void __stdcall PassaValori( char *, const int );
	void __stdcall ProvaMenoUno( unsigned char );
	void __stdcall TestPuntatore( char * ); 
}

int main( int argc, char * argv[] )
{
	setlocale( LC_ALL, "italian" );
	int numero = 0;
	char * p = pippo( &numero );
	cout << numero << " " << p << endl;
	int numero2 = 6;
	cout << numero2 << " " << ( numero2 << 1 ) << endl;
	unsigned char myString [] = "This is my string";
	unsigned char * fab = &myString[0];
	char numeroNuovo = 'f';
	PassaValore( &numeroNuovo );
	cout << "Il carattere è " << numeroNuovo << endl; 
	
	char arrayNuovo[] = "fabrizio";
	//char * arrayNuovo = "fabrizio";
	PassaValori( arrayNuovo, strlen( arrayNuovo ) );
	cout << "Il carattere è " << arrayNuovo << endl; 
	unsigned char m = -1;
	ProvaMenoUno( m );

	char * puntatoreCarattere = NULL;
	char carattere = 'F';
	puntatoreCarattere = &carattere;
	TestPuntatore( puntatoreCarattere );


	system( "pause" );
	return 0;
}