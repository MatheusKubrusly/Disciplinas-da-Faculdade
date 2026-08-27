package factorymethod;

public class FabricaBicicleta extends Logistica {

	//Implementação concreta do Factory Method
	public ITransporte criaTransporte() {
		return new Bicicleta();
	}

}
