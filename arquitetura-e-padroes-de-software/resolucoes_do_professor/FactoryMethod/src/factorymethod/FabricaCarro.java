package factorymethod;

public class FabricaCarro extends Logistica {

	//Implementação concreta do Factory Method
	public ITransporte criaTransporte() {
		return new Carro();
	}

}
