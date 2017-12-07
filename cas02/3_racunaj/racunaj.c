#include <stdio.h>

// funkcija koja u zavisnosti od treceg argumenta vrsi
// sabiranje, oduzimanje, mnozenje, deljenje ili trazi ostatak 
// pri deljenju prva dva argumenta
int racunaj(int, int, char) ;

int main()
{
	int a, b;
	char op;
	scanf("%d %c %d", &a, &op, &b);
	printf("Rezultat: %d\n", racunaj(a, b, op));
	return 0;
}