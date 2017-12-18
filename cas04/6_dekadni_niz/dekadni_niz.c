#include <stdio.h>

int dekadni_niz(unsigned, int[]) ;

int main()
{
	int niz[10] ;
	int n, duzina, i;
	scanf("%u", &n);
	duzina = dekadni_niz(n, niz);
	for(i=0; i<duzina; i++)
	{
		printf("%d ", niz[i]);
	}
	printf("\n");
}