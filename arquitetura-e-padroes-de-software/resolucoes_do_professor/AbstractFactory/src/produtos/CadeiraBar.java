package produtos;

public class CadeiraBar implements ICadeira {

	@Override
	public void sentar() {
		System.out.println("Senta e pede uma gelada");
	}

}
