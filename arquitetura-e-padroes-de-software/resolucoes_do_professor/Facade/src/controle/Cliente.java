package controle;

import model.Aluno;
import model.Database;
import model.ModelFacade;

public class Cliente {

	public static void main(String[] args) {
		//Cria uma instancia da classe de serviço
		
		
		//Chama algum metodo da classe de servico
		//para executar algo ou obter alguma informacao
		ModelFacade facade = new ModelFacade();
		Aluno a = facade.buscaAlunoPorId(1);
		Aluno b = facade.buscaAlunoPorId(2);
		Aluno c = facade.buscaAlunoPorNome("Maycom");
		Aluno d = facade.buscaAlunoPorNome("Lara");
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
	}

}
