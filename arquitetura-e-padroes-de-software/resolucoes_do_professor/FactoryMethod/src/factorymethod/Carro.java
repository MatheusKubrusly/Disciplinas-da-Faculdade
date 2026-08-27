package factorymethod;

public class Carro implements ITransporte {

	@Override
	public void entrega() {
		System.out.println("Entrega feita via carro");
	}
}
