package database_connectivity;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Objects;

public class DataBaseConnection {
	
	private static DataBaseConnection instance;
	private Connection connection;

	private DataBaseConnection() {
		try {
			// Para conseguir rodar este comando abaixo, foi necessário carrega
			// o arquivo do Driver do PostgreSQL para a pasta pai deste nosso projeto
			// e chamá-la durante o momento de execução da função que precisar utilizar
			// dos métodos definidos dentro desta classe.
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/simulacao_crud_cliente", "matheus-ku", "2323025BCC@cefet");
		}
		catch(SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Ocorreu um erro ao tentar se conectar ao banco de dados.");
		}
	}

	public static DataBaseConnection getInstance() {
		if(Objects.isNull(instance)) {
			instance = new DataBaseConnection();
		}
		return instance;
	}

	public Connection connection() {
		return connection;
	}
}
