#include <stdio.h>

// nasa funkcija
// kako C dozvoljava da se pri deklaraciji izostave imena argumenata,
// nije neophodno da ih pisemo
int maksimum(int, int) ;

int main()
{
	int a, b;
	scanf("%d %d", &a, &b);
	printf("Max: %d\n", maksimum(a, b));
	return 0;
}