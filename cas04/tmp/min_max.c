#include <stdio.h>

void min_max(int [], int, int*, int*) ;

int main()
{
	int a[] = {8, 1, -55, 11, 26, 0, 99, 8};
	int n = 8;
	int min, max;
	min_max(a, n, &min, &max);
	printf("Min: %d Max: %d\n", min, max);
}