package estrategias;

public class CorrendoStrategy implements IStrategy {

	@Override
	public void executar(String a, String b) {
		System.out.println("Correndo de " + a + " até " + b);
	}

}
