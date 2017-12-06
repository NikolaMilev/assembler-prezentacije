#include <stdio.h>

// funkcija koja u zavisnosti od treceg argumenta vrsi
// sabiranje, oduzimanje, mnozenje, deljenje ili trazi ostatak 
// pri deljenju prva dva argumenta
long racunaj(long, long, char) ;

int main()
{
	long a, b;
	char op;
	scanf("%ld %c %ld", &a, &op, &b);
	printf("Rezultat: %ld\n", racunaj(a, b, op));
	return 0;
}