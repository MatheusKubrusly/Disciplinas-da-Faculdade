package principal;

import fabrica.*;
import produtos.ISofa;

public class Cliente {

	public static void main(String[] args) {
		// Cria produtos de acordo com o estilo
		// da fábrica concreta que quiser
		
		MoveisFactory fabrica = new MoveisGamerFactory();
		fabrica.criaMoveis();
		
		fabrica = new MoveisBarFactory();
		fabrica.criaMoveis();
		

		
		
		
		
		// Pergunta: Como podemos fazer para criar uma nova
		// linha (estilo) de produtos?
		//R: Criar os produtos dessa nova linha.
		//Ex: CadeiraEscritorio, SofaEscritorio
		//Criar a fabrica correspondente. Ex:MoveisEscritorioFactory

		
		
		// Pergunta: Como podemos fazer para aumentar a 
		// família de produtos?
		//Criar a interface do novo produto e os produtos de cada
		//estilo existente. Ex: IMesa, MesaGamer, MesaBar etc..
		//Em MoveisFactory criar o método abstrato IMesa criaMesa()
		//Em cada fábrica implementa o factory method do novo produto
	}

}
