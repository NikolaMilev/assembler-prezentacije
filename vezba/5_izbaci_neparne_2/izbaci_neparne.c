#include <stdio.h>

#define MAX 100

void izbaci_neparne(long a[], int *n) ;

void ucitaj(long niz[], int n)
{
	int i;
	for(i = 0; i < n; i++)
	{
		scanf("%ld", &niz[i]);
	}
}

void pisi(long niz[], int n)
{
	int i;
	for(i = 0; i < n; i++)
	{
		printf("%ld ", niz[i]);
	}
	printf("\n");
}

int main()
{
	long a[MAX]; 
	int n;
	scanf("%d", &n);
	printf("Unesite niz:\n");
	ucitaj(a, n);
	printf("Pre izbacivanja: \n");
	pisi(a,n);
	izbaci_neparne(a, &n);
	printf("Posle izbacivanja: \n");
	pisi(a,n);
}