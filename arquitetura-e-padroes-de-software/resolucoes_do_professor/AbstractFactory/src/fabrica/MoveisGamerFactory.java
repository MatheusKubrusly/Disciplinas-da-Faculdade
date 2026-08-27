package fabrica;

import produtos.*;

public class MoveisGamerFactory extends MoveisFactory {

	@Override
	protected ICadeira criaCadeira() {
		return new CadeiraGamer();
	}

	@Override
	protected ISofa criaSofa() {
		return new SofaGamer();
	}

}
