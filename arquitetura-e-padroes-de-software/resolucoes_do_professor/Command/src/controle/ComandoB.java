package controle;

public class ComandoB implements ICommand {

	@Override
	public void execute() {
		System.out.println("Executou o comando B");
	}

	@Override
	public void undo() {
		System.out.println("Desfez o comando B");
	}
}