package sing;

//Esta classe é um Singleton
public class ConexaoBD {
	
	private static ConexaoBD instancia;
	
	public String tema;
	
	//Único construtor, mantendo privado
	private ConexaoBD() {
		tema = "claro";
	}
	
	//Garante o retorno da instância única
	public static ConexaoBD getInstance() {
		if(instancia == null) {
			instancia = new ConexaoBD();
		}
		return instancia;
	}
}
