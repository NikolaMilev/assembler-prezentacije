#include <stdio.h>

// Ojlerova funkcija broja n oznacava broj brojeva
// strogo manjih od n koji su uzajamno prosti sa n
unsigned ojler(unsigned) ;

int main()
{
	unsigned a;
	printf("Unesite broj: ");
	scanf("%u", &a);
	printf("Vrednost Ojlerove funkcije broja %u je %u\n", a, ojler(a));
	return 0;
}