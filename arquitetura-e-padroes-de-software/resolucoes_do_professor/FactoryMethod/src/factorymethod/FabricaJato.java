package factorymethod;

public class FabricaJato extends Logistica {

	//Implementação concreta do Factory Method
	public ITransporte criaTransporte() {
		return new Jato();
	}

}
