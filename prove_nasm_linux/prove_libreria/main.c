#include <stdio.h>

extern int funzione( void );

int main()
{
    funzione(); // should be 4...
    return 0;
} 
