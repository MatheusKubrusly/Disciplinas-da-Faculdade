public interface Command {
	public void  execute(); //executa o comando
	public void undo(); //desfaz o comando mais recente    
}
