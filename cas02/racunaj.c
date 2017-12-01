#include <stdio.h>

int racunaj(int a, int b, char op) ;

int main()
{
	int a, b;
	char op;
	scanf("%d %c %d", &a, &op, &b);
	printf("Rezultat: %d\n", racunaj(a, b, op));
	return 0;
}