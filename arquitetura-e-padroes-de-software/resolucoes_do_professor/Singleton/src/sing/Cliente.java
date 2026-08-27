package sing;

public class Cliente {

	public static void main(String[] args) {
		// Tentar criar mais de uma instância da classe singleton
		ConexaoBD i1 = ConexaoBD.getInstance();
		ConexaoBD i2 = ConexaoBD.getInstance();
		ConexaoBD i3 = ConexaoBD.getInstance();
		
		//Para testar:
		
		//Criar algum atributo que possa ser modificado 
		//e verificar se as variáveis estão 
		//referenciando o mesmo objeto		
		System.out.println(i1.tema);
		System.out.println(i2.tema);
		System.out.println(i3.tema);
		i1.tema = "escuro";
		System.out.println(i1.tema);
		System.out.println(i2.tema);
		System.out.println(i3.tema);
		i3.tema = "claro";
		System.out.println(i1.tema);
		System.out.println(i2.tema);
		System.out.println(i3.tema);
	
	}

}
