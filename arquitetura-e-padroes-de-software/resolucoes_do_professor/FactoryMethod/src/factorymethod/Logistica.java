package factorymethod;

public abstract class Logistica {
	
	 //Factory Method
	public abstract ITransporte criaTransporte();
	
	public void realizaEntrega() {
		
		//Cria produto "genérico" a partir do Factory Method
		ITransporte t = criaTransporte();
		
		//Pode invocar algum método do produto
		t.entrega();
	}
}

//Para cada produto criar sua classe ProdutoFactory correspondente
