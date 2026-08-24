package database_connectivity;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Objects;

public class DataBaseConnection {
	
	private static DataBaseConnection instance;
	private Connection connection;

	private DataBaseConnection() throws SQLException {
		try {
			// Para conseguir rodar este comando abaixo, foi necessário carrega
			// o arquivo do Driver do PostgreSQL para a pasta pai deste nosso projeto
			// e chamá-la durante o momento de execução da função que precisar utilizar
			// dos métodos definidos dentro desta classe.
			// Além disto, para conseguir reproduzir este código em outra máquina,
			// será necessário atribuir o caminho deste driver ao CLASSPATH para que
			// a JVM consiga localizar globalmente este arquivo.
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/simulacao_crud_cliente", "matheus-ku", "2323025BCC@cefet");
		}
		catch(SQLException e) {
			throw e; 
		}
	}

	public static DataBaseConnection getInstance() throws SQLException {
		if(Objects.isNull(instance)) {
			try {
				instance = new DataBaseConnection();
			}
			catch(SQLException e) {
				throw e;
			}
		}
		return instance;
	}

	public Connection connection() {
		return connection;
	}
}
