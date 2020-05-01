package kr.or.bit;

public class SamsungComputerFactory implements ComputerFactory{
	public SamsungKeyboard createKeyboard() {
        return new SamsungKeyboard();
    }

    public SamsungMouse createMouse() {
        return new SamsungMouse();
    }
}
