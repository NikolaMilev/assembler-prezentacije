#include <stdio.h>

void obrni(int[], int) ;

int main()
{
	int a[] = {1,2,3,4,5,6,7,8};
	int n = 8, i;
	printf("Pre obrtanja: ");
	for(i=0; i<n; i++)
	{
		printf("%d ", a[i]);
	}
	printf("\n");
	
	obrni(a, n);
	
	printf("Posle obrtanja: ");
	for(i=0; i<n; i++)
	{
		printf("%d ", a[i]);
	}
	printf("\n");

	return 0;
}