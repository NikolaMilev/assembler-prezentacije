#include <stdio.h>

unsigned fibonaci(unsigned n) ;

int main()
{
	int n;
	scanf("%u", &n);
	printf("%u\n", fibonaci(n));
	return 0;
}