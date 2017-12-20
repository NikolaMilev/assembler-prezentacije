#include <stdio.h>

int binarna_pretraga(int a[], int poc, int kr, int elem) ;

int main()
{
	int a[] = {-1, 5, 13, 99, 111, 10000} ;
	// ovo je u redu samo ovde! 
	// ne pisati ovakvo trazenje duzine niza u kodu!
	int n = sizeof(a)/sizeof(a[0]);
	int ind, element = 13;
	ind = binarna_pretraga(a, 0, n-1, element);
	if(ind > 0)
	{
		printf("Indeks elementa: %d je %d\n", element, ind);
	}
	else
	{
		printf("Element %d nije sadrzan u nizu!\n", element);
	}
}