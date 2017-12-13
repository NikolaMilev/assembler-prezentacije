#include <stdio.h>

void min_max(int[], int, int*, int*) ;

int main()
{
	int a[] = {-18, 17, 55, 5, -36, 2, 0, 13};
	int n = 8;
	int min, max;
	min_max(a, n, &min, &max);
	printf("Minimum: %d, maksimum: %d\n", min, max);
	return 0;
}