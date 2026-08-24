package cli_implementation;
import java.util.HashMap;

public class Invoker {

	HashMap<String,Command> listaComandos = new HashMap<>();
	
	static { //bloco de inicialização estática
		listaComandos.put("Incluir", new IncluirClienteCommand());
		listaComandos.put("Alterar", new AlterarClienteCommand());
		listaComandos.put("Excluir", new ExcluirClienteCommand());
		listaComandos.put("Listar", new ListarClientesCommand());
	}

	public static void invoke(String comando, HashMap listaParametros) { //este método será oferecido ao usuário para que ele possa tentar executar os comandos que serão oferecidos
		switch(comando) {
			case "Incluir":
				listaComandos[comando].execute(listaParamentros);
			case "Alterar":
				listaComandos[comando].execute(listaParametros);
			case "Excluir":
				listaComandos[comando].execute(listaParametros);		
			case "Listar":
				listarComandos[comando].execute(listaParametros);
			default: 
				System.err.println("O comando especificado não existe");
		}
			
	}

	public static void undo() { 
		//este método encapsula o método undo() pertencente a cada classe que implementa Command
		//desta forma, o usuário não terá acesso direto aos métodos undo() originais
		
		
	}

}

