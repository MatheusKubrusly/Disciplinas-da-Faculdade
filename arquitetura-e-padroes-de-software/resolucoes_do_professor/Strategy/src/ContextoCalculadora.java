import estrategias.*;

public class ContextoCalculadora {
	
	//Referência da estratégia a utilizar
	private ICalculadora calcu;
	//Permite trocar a estratégia 
	//em tempo de execução
	public void setEstrategia(ICalculadora e) {
		this.calcu = e;
	}
	
	//Executa a estratégia atual
	public double calcular(double a, double b) {
		return this.calcu.calcular(a, b);
	}
	
}
