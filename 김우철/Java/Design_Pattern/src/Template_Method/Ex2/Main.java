//https://limkydev.tistory.com/81
//ц╓ец

package Template_Method.Ex2;

public class Main {
	public static void main(String[] args) {
		Car labo = new ManualOperationCar();
		Car bmw = new AutomaticOperationCar();
		
		System.out.println("[AutomaticOperationCar]");
		bmw.playWithOwner();
		System.out.println("\n");
		System.out.println("[ManualOperationCar]");
		labo.playWithOwner();

	}

}