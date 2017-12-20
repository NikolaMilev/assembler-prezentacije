#include <stdio.h>

// funkcija koja vraca n-ti Fibonacijev broj
// indeks: 0, 1, 2, 3, 4, 5, 6, 7,  8, ...
// niz:    0, 1, 1, 2, 3, 5, 8, 13, 21, ...
unsigned fibonaci(unsigned n) ;

int main()
{
	int n;
	scanf("%u", &n);
	printf("%u\n", fibonaci(n));
	return 0;
}