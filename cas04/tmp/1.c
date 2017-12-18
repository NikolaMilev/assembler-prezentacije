#include <stdio.h>

void dekadne_cifre(unsigned, unsigned[], int*);

int main()
{
	int duzina, i;
	unsigned n, niz[20];
	scanf("%d", &n);
	dekadne_cifre(n, niz, &duzina);
	for(i=0; i < duzina; i++)
	{
		printf("%u ", niz[i]);
	}
	printf("\n");
	return 0;
}