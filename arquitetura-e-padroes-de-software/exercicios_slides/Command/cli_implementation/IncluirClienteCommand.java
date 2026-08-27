package cli_implementation;
import database_connectivity.DataBaseConnection;
import java.util.HashMap;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class IncluirClienteCommand implements Command {
	
	// Cada instância desta classe terá seus dados específicos!
	private int idCliente;
	private String nomeCliente;

	public void setID(int id) {
		idCliente = id;
	}

	public void setNome(String nome) {
		nomeCliente = nome;
	}

	public void execute() {
		try {
			Connection connection = DataBaseConnection.getInstance().connection();
			connection.setAutoCommit(false);
			PreparedStatement statement = connection.prepareStatement("insert into cliente (nome, id) values (?,?)");
			// Iremos injetar os dados de forma dinâmica dentro da sentença SQL 
			// que pretendemos executar.
			statement.setString(1, nomeCliente);
			statement.setInt(2, idCliente);
			statement.execute(); 
			// Posteriormente, podemos implementar algo para validar o resultado
			// obtido após a atualização do banco de dados realizada.
			connection.commit();

			System.out.println("Operação de inclusão realizada com sucesso");
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void undo() {
		// Para remover um cliente do banco de dados, será necessário
		// buscar pelo seu id (primary key) e depois remover esta respectiva
		// tupla da tabela.
		try {	
			Connection connection = DataBaseConnection.getInstance().connection();
			connection.setAutoCommit(false);
			PreparedStatement statement = connection.prepareStatement("delete from cliente where id = ?");
			statement.setInt(1, idCliente);
			statement.execute();
			connection.commit(); // Agora sim estou persistindo as alterações realizadas dentro do banco de dados!

			System.out.println("Operação de deleção realizada com sucesso!");
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
