import estrategias.*;

public class Cliente {

	public static void main(String[] args) {
		//Cliente cria contexto
		Contexto con = new Contexto();
		
		//Define e executa a estratégia que quiser
		con.executar("Sala 3", "Entrada do CEFET");
		
		//Pode alterar a estratégia e executar novamento
		con.setEstrategia(new MoonwalkStrategy());
		con.executar("Sala 3", "Entrada do CEFET");
		
		con.setEstrategia(new RolamentoStrategy());
		con.executar("Entrada do CEFET", "Bangu");
		
		ContextoCalculadora calculadora = new ContextoCalculadora();
		calculadora.setEstrategia(new AdicaoStrategy());
		double resultado = calculadora.calcular(5,2);
		System.out.println("Resultado = " + resultado);
	}

}
