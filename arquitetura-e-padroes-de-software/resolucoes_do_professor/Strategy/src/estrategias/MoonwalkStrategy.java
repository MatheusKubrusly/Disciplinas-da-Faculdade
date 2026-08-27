package estrategias;

public class MoonwalkStrategy implements IStrategy {

	@Override
	public void executar(String a, String b) {
		System.out.println("Indo de " + a + " até " + b
				+ " fazendo um moonwalk!");
	}

}
