#include <stdio.h>

void izbaci(int a[], unsigned *len, unsigned ind) ;

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
	int a[] = {1,2,3,4,5,6,7,8,9,10};
	unsigned len = 10;
	unsigned ind;
	printf("Niz: \n");
	ispisi(a, len);
	printf("Unesite indeks elementa niza kog zelite da izbacite: ");
	scanf("%u", &ind);
	izbaci(a, &len, ind);
	printf("Nakon izbacivanja: \n");
	ispisi(a, len);
	return 0;
}