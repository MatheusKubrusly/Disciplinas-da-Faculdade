package controle;
import java.util.ArrayList;
import java.util.EmptyStackException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

public class Invoker {
	
	//Estrutura para armazenar os comandos
	static Map<String, ICommand> comandos = new HashMap<String, ICommand>();
	
	static Stack<ICommand> historico = new Stack<ICommand>();
	
	static {
		//Define qual chave para invocar qual comando
		 comandos.put("A", new ComandoA());
		 comandos.put("B", new ComandoB());
		 comandos.put("Comando B", new ComandoB());
		 //...
	}
	
	public static void invoke(String comando) {
		try {
			ICommand c = comandos.get(comando); // recupera comando
			// executa o comando concreto
			c.execute();
			
			// adiciona ao historico
			historico.push(c);
			
		} catch(NullPointerException e) {
			System.err.println("Comando inválido");
		}
	}
	
	public static void undo() {
		// Desfaz o último comando executado
		try {
			ICommand c = historico.pop();
			c.undo();
		} catch (EmptyStackException e) {
			System.err.println("Não há comandos para desfazer");
		} catch (Exception e) {
			System.err.println("Erro desconhecido. Não sei o que houve!");
		}
	}
	
	//Como desfazer de uma só vez todos os comandos?
	//Poderia criar um método undoAll()
	
	public static void undoAll() {
		//Desfaz todos os comandos da pilha
		while(!historico.isEmpty()) {
			undo();
		}

	}

}
