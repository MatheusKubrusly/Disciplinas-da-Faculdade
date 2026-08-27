package client_side;
import java.util.HashMap;
import cli_implementation.*;
import database_connectivity.DataBaseConnection;
import java.sql.Connection;
import java.sql.SQLException;

public class ClientService {
	
	public static void main(String args[]) {	
			HashMap<String,Object> listaParametros = new HashMap<>(); 
			// Quando formos trabalhar com estas variáveis separadamente, teremos que 
			// fazer um type casting para convertê-las de Object para o tipo que 
			// realmente é de nosso interesse.
			listaParametros.put("id", 123);
			listaParametros.put("nome", "Matheus Kubrusly");
			Invoker.invoke("Incluir", listaParametros);
			//Invoker.undo(listaParametros);
	}

}
