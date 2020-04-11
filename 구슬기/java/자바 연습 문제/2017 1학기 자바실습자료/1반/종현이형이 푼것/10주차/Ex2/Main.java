
public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Cafe myCafe = new Cafe("HOLLYS");
		myCafe.cafeInfo();
		myCafe.snowMenu();
		
		myCafe.makeCoffee();
		myCafe.makeCoffee(true);
		myCafe.makeLatte("두유");
		myCafe.makeLatte("우유",true);
	}

}
