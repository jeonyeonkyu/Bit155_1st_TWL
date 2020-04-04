//https://limkydev.tistory.com/81
//ц╓ец

package Template_Method.Ex2;

public class Main {
	public static void main(String[] args) {
		Car labo = new ManualOperationCar();
		Car bmw = new AutomaticOperationCar();
		
		labo.playWithOwner();
		System.out.println("\n\n");
		bmw.playWithOwner();

	}

}
