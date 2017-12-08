#include <stdio.h>

/* 
	globalnja promenljiva i
 	simbol i vidljiv je i iz drugog fajla
*/
int i = 5;

// funkcija
void promeni() ;

int main()
{
	printf("Pre: %d\n", i);
	promeni();
	printf("Posle: %d\n", i);
	return 0;
}