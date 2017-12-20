#include <stdio.h>

unsigned long faktorijel(unsigned) ;

int main()
{
	unsigned n;
	scanf("%u", &n);
	printf("%u! = %lu\n", n, faktorijel(n));
	return 0;
}