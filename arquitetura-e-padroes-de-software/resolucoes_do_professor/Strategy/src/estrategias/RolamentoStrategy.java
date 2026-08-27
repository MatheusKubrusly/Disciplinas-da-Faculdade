package estrategias;

public class RolamentoStrategy implements IStrategy {

	@Override
	public void executar(String a, String b) {
		System.out.println("Indo de " + a + " até " + b
				+ " fazendo rolamento!");
	}

}
