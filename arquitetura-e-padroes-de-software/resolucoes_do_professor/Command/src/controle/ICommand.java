package controle;

//Interface para definir os métodos
//que um Command PRECISA possuir
public interface ICommand {
	
	public void execute();
	
	public void undo();
}
