package model;

//Exemplo de qualquer entidade
//com seus atributos, construtores
//e métodos
public class Aluno {
	long id;
	String nome;
	
	static long count = 99;
	
	public Aluno(long id) {
		this.id = id;
		this.nome = "Aluno " + id;
	}
	
	public Aluno(String nome) {
		this.id = count++;
		this.nome = nome;
	}

	@Override
	public String toString() {
		return "Aluno [id=" + id + ", nome=" + nome + "]";
	}
}

//Podemos ter outras entidades...
