#include <stdio.h>

int racunaj(int, int, char) ;

int main()
{
	int a, b;
	char c;
	scanf("%d %c %d", &a, &c, &b);
	printf("Rezultat: %d\n", racunaj(a,b,c));
	return 0;
}