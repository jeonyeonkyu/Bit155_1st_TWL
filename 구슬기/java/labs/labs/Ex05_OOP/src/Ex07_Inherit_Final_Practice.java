class Card{
	final String KIND = "heart";
	final int NUM = 10;
	
	void method() {
		System.out.println(Math.PI);
	}
}
class Vcardd{
	final String KIND;
	final int NUM;
	
	Vcardd(String KIND, int NUM){
		this.KIND = KIND;
		this.NUM =NUM;
	}

	@Override
	public String toString() {
		return "Vcard [KIND=" + KIND + ", NUM=" + NUM + "]";
	}
	
}
public class Ex07_Inherit_Final_Practice {
	public static void main(String[] args) {
		Card c = new Card();
		c.method();
		System.out.println(c.NUM);
		
		Vcardd v = new Vcardd("spade",7);
		System.out.println(v); 
		System.out.println(v.toString()); 
		
		//toString 오버라이딩을 안해놓으면 두개다 주소값나옴
		//toString 오버라이딩을 하면 두개다  [KIND=spade, NUM=7]

		
	}

}
