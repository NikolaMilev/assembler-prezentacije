#include <stdio.h>

unsigned ojler(unsigned) ;

int main()
{
	unsigned a;
	printf("Unesite broj: ");
	scanf("%u", &a);
	printf("Vrednost Ojlerove funkcije broja %u je %u\n", a, ojler(a));
	return 0;
}