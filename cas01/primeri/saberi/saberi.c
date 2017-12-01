#include <stdio.h>

// deklarisemo funkciju koja prima dva int argumenta i vraca int vrednost
// definicija se ne nalazi u ovom fajlu tako da ce je linker traziti u ostalim
// definicija funkcije saberi nalazi se u saberi.s
// ceo program prevodi se naredbom gcc saberi.c saberi.s
int saberi(int a, int b);

// main funkcija
int main()
{	
	// deklarisemo dve cetvorobajtne lokalne promenljive
	int a, b;
	// ucitavamo njihove vrednosti pozivom funkcije scanf
	scanf("%d %d", &a, &b);
	// stampamo zbir
	printf("Zbir: %d\n", saberi(a, b));
	return 0;
}