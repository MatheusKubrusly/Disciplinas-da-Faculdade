public class Cliente {

	//Desta forma, não conseguirei acessar os atributos diretamente, o que me permite aplicar algum filtro antes de permitir a alteração destes dados
	private String nome;
	private int id;
	
	public Cliente() {
	
	}
	
	public Cliente(String nome, int id) {
		this.nome = nome;
		this.id = id;
	}

	public void setID(int id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getID() {
		return this.id;
	}

	public String getNome() {
		return this.nome;
	}
}
