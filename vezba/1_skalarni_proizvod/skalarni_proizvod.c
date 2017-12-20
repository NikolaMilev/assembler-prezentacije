#include <stdio.h>

#define MAX 20

long skalarni_proizvod(long a[], long b[], int n);

void ucitaj(long a[], int n)
{
	int i;
	for(i = 0; i < n; i++)
	{
		scanf("%ld", &a[i]);
	}
}

int main()
{
	long a[MAX], b[MAX];
	int n;
	//printf("%lu %lu\n", sizeof(long));
	printf("Unesite duzinu:\n");
	scanf("%d", &n);
	printf("Unesite prvi niz:\n");
	ucitaj(a, n);

	printf("Unesite drugi niz:\n");
	ucitaj(b, n);

	printf("Skalarni proizvod: %ld\n", skalarni_proizvod(a, b, n));

	return 0;
}