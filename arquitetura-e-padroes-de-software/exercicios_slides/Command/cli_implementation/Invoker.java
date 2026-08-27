package cli_implementation;
import java.util.HashMap;
import java.util.ArrayList; // Preserva a ordem dos elementos dentro da lista!

public class Invoker {

	private static HashMap<String,Command> listaComandos = new HashMap<>();
	private static ArrayList<Command> historicoComandos = new ArrayList<>();

	static { //bloco de inicialização estática
		listaComandos.put("Incluir", new IncluirClienteCommand());
		//listaComandos.put("Alterar", new AlterarClienteCommand());
		//listaComandos.put("Excluir", new ExcluirClienteCommand());
		//listaComandos.put("Listar", new ListarClientesCommand());
	}

	public static void invoke(String comando, HashMap listaParametros) { //este método será oferecido ao usuário para que ele possa tentar executar os comandos que serão oferecidos
		switch(comando) {
			case "Incluir":
				// Como forma de garantia de segurança, o compilador bloqueia 
				// a tentativa de atribuição de um Command a uma variável de um 
				// tipo abaixo dela, como ocorre no exemplo abaixo. Isto é feito
				// para garantir que não iremos tentar atribuir um AlterarClienteCommand
				// a um IncluirClienteCommand. Para contornar esta questão, basta
				// que apliquemos o tipe castyng antes da atribuição.
				IncluirClienteCommand comandoIncluir = (IncluirClienteCommand) listaComandos.get(comando);
				comandoIncluir.setID((Integer) listaParametros.get("id"));
				comandoIncluir.setNome((String) listaParametros.get("nome"));
				comandoIncluir.execute();
				historicoComandos.add(comandoIncluir);
				break;
			case "Alterar":
				//listaComandos.get(comando).execute(listaParametros);
				//historicoComandos.add(comando);
			case "Excluir":
				//listaComandos.get(comando).execute(listaParametros);
				//historicoComandos.add(comando);
			case "Listar":
				//listarComandos.get(comando).execute(listaParametros);
				//historicoComandos.add(comando);
			default: 
				System.err.println("O comando especificado não existe");
		}
			
	}

	public static void undo(HashMap ListaParametros) { 
		// Este método encapsula o método undo() pertencente a cada 
		// classe que implementa Command.
		// Desta forma, o usuário não terá acesso direto aos métodos undo() originais.
		if(historicoComandos.size() > 0) {	
			// Precisamos encontrar o último comando que foi executado!
			Command ultimoComando = historicoComandos.remove(historicoComandos.size() - 1);
			ultimoComando.undo();
			System.out.println("O último comando foi desfeito com sucesso");
		}
		else {
			System.out.println("Não há comandos para desfazer!");
		}
	}

}

