#include <stdio.h>

void izbaci_neparne(int a[], unsigned *len) ;

void ispisi(int a[], unsigned n)
{
	int i;
	for(i = 0; i < n; i++)
	{
		printf("%d ", a[i]);
	}
	printf("\n");
}

int main()
{
	int a[] = {-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5} ;
	unsigned len = 11;
	printf("Pre izbacivanja: \n");
	ispisi(a, len);
	izbaci_neparne(a, &len);
	printf("Posle izbacivanja: \n");
	ispisi(a, len);
	return 0;
}