#include <stdio.h>

int prost(unsigned) ;

int main()
{
	unsigned a;
	printf("Unesite broj: ");
	scanf("%u", &a);
	if(prost(a))
	{
		printf("Broj je prost!\n");
	}
	else 
	{
		printf("Broj nije prost!\n");
	}
	return 0;
}