package principal;

import factorymethod.*;

public class Cliente {

	public static void main(String[] args) {
		//Cria logística concreta da fábrica desejada 
		//e invoca o método de plano de entrega
		Logistica fabrica = new FabricaBicicleta();
		fabrica.realizaEntrega();
		
		fabrica = new FabricaCarro();
		fabrica.realizaEntrega();
		
		//Também pode chamar o Factory Method diretamente
		fabrica = new FabricaJato();
		ITransporte jatinhoVirginia = fabrica.criaTransporte();
		jatinhoVirginia.entrega();
		
		
		
		
		// Pergunta: E se quisermos criar uma nova fábrica
		// de produto para integrar com a logística atual?
		// Como fazer?
		//R: Criar uma nova fábrica. Ex: FabricaDrone
		//e seu produto (transporte) correspodente.
		
	}

}
