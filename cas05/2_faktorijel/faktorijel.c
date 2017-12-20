#include <stdio.h>

unsigned long long faktorijel(unsigned) ;

int main()
{
	unsigned n;
	scanf("%u", &n);
	printf("%lu\n\n", sizeof(unsigned long long));
	printf("%u! = %llu\n", n, faktorijel(n));
	return 0;
}