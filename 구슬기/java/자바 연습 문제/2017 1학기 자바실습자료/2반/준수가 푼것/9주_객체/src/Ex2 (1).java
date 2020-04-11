
public class Ex2 {
	public static void main (String[] args){
		Cafe myCafe = new Cafe("Holly");
		myCafe.cafeInfo();
		myCafe.showMenu();
		myCafe.makeCoffee();
		myCafe.makeCoffee(true);
		myCafe.makeLatter("두유");
		myCafe.makeLatter("우유",true);
		
		
	}
}
