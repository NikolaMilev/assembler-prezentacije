#include <stdio.h>

void swap(int*, int*) ;

int main()
{
	int a, b;
	printf("Unesite dva broja: ");
	scanf("%d %d", &a, &b);
	printf("Pre zamene: %d %d\n", a, b);
	swap(&a, &b);
	printf("Posle zamene: %d %d\n", a, b);
	return 0;
}