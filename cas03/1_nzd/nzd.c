#include <stdio.h>

unsigned nzd(unsigned, unsigned) ;

int main()
{
	unsigned a, b;
	printf("Unesite dva broja: ");
	scanf("%u %u", &a, &b);
	printf("NZD(%u, %u) = %u\n", a, b, nzd(a,b));
	return 0;
}