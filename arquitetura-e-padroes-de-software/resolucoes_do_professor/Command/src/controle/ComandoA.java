package controle;

public class ComandoA implements ICommand {

	@Override
	public void execute() {
		System.out.println("Executou o comando A");
	}

	@Override
	public void undo() {
		System.out.println("Desfez o comando A");
	}
	
	//Como seria um ComandoB?
}