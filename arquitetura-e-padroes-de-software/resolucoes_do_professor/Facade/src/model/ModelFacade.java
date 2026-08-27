package model;

//Classe de "fachada"
public class ModelFacade {
	
	//Inclui métodos que quer disponibilizar para o exterior
	//sobre qualquer classe do pacote model
	
	public static Aluno buscaAlunoPorId(long id) {
		return Database.buscaAlunoPorId(id);
	}
	
	public static Aluno buscaAlunoPorNome(String nome) {
		return Database.buscaAlunoPorNome(nome);
	}
	
	//...
}
