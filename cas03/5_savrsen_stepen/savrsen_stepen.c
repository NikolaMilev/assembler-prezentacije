#include <stdio.h>
// funckija ispituje da li je n = m^k za neke prirodne brojeve m i k  (k > 1). Ako jeste,
// vraca 1, a preko pokazivaca vraca m i k.
int savrsen_stepen(unsigned, unsigned*, unsigned *);

int main()
{
	unsigned n, m, k;
	printf("Unesite ceo broj: ");
	scanf("%u", &n);
	if(savrsen_stepen(n, &m, &k))
	{
		printf("%u = %u ^ %u\n", n, m, k);
	}
	else
	{
		printf("Broj %u nije savrsen stepen!\n");
	}
}