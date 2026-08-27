package model;

//Classe que queremos proteger.
//Responsável por realizar consultas ao BD
public class Database {
	
	protected static Aluno buscaAlunoPorId(long id) {
		// Faz consulta no BD e retorna o objeto aluno
		System.out.println("Select * from Aluno where id = " + id);
		return new Aluno(id);
	}
	//Podemos criar mais consultas...
	//e também para outras entidades...
	protected static Aluno buscaAlunoPorNome(String nome) {
		// Faz consulta no BD e retorna o objeto aluno
		System.out.println("Select * from Aluno where nome = " + nome);
		return new Aluno(nome);
	}
	
	
	//Algumas consultas podem ser expostas na fachada
	//e outras permanecem escondidas
	protected void calculaCrAluno(long id) {
		//Faz o calculo do CR do aluno
	}
}
