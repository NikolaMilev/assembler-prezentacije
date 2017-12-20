#include <stdio.h>

long foo1(long) ;

long foo2(long) ;

int main()
{
	// promenljiva kojoj su visa 4 bajta
	// 0x0000000F
	// a niza 4 bajta
	// 0x00000005
	long n = 0xF00000005;

	printf("foo1: %ld\n", foo1(n));
	printf("foo2: %ld\n", foo2(n));

	return 0;
}