package factorymethod;

public class Bicicleta implements ITransporte {

	@Override
	public void entrega() {
		System.out.println("Entrega feita via bicicleta");
	}
}
