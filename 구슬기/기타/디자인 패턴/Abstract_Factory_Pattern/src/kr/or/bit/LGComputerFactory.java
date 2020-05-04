package kr.or.bit;

public class LGComputerFactory implements ComputerFactory{
	public LGKeyboard createKeyboard() {
        return new LGKeyboard();
    }

    public LGMouse createMouse() {
        return new LGMouse();
    }
}
