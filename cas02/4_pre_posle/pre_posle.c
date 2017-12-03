#include <stdio.h>

int i = 5;

void promeni() ;

int main()
{
	printf("Pre: %d\n", i);
	promeni();
	printf("Posle: %d\n", i);
	return 0;
}