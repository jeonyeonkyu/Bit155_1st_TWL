package templatemethodpattern;

public class Main {

	public static void main(String[] args) {
		Car labo = new ManualOperationCar();
		Car bmw = new AutomaticOperationCar();
		
		labo.playWithOwner();
		
		System.out.println("\n\n");
		
		bmw.playWithOwner();
	}

}
