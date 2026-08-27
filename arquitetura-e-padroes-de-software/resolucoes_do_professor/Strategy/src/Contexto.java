import estrategias.*;

public class Contexto {
	
	//Referência da estratégia a utilizar
	private IStrategy estrategia;
	
	public Contexto() {
		//Opcional: podemos definir alguma 
		//estratégia para ser a padrão
		
		setEstrategia(new CorrendoStrategy());
	}
	
	//Permite trocar a estratégia 
	//em tempo de execução
	public void setEstrategia(IStrategy e) {
		this.estrategia = e;
	}
	
	//Executa a estratégia atual
	public void executar(String a, String b) {
		this.estrategia.executar(a, b);
	}
	
}
