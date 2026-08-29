#include <stdio.h>

int x = 0;
int y = 0;

int funcao_a_parte() {
	printf("%d e %d", x, y);
}

int main() {
	int x = 5;
	y= 5;

	// É possível que nós declaremos funções dentro de 
	// uma outra função.
	int oi() {
		// O valor de x que será exibido é igual a 5
		printf("%d e %d", x,y);
	}

	funcao_a_parte();
       	oi();	
	// Como estamos trabalhando com escopo local, 
	// o valor de x que será exibido é igual a zero
	
	// Se tivéssemos um escopo dinâmico, a função,
	// antes de olhar para o escopo global, procuraria 
	// pela variável dentro do escopo da função chamadora,
	// sendo, neste caso, a função main.
	// Logo, teríamos o valor 5 sendo exibido
	return 0;
}
