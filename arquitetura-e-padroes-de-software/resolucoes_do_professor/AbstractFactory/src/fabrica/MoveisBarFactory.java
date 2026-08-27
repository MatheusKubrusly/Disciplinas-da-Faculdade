package fabrica;

import produtos.*;

public class MoveisBarFactory extends MoveisFactory {

	@Override
	protected ICadeira criaCadeira() {
		return new CadeiraBar();
	}

	@Override
	protected ISofa criaSofa() {
		return new SofaBar();
	}

}
