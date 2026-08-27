package estrategias;

public class AdicaoStrategy implements ICalculadora {

	@Override
	public double calcular(double a, double b) {
		return a + b;
	}

}
