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
		
		//toString �������̵��� ���س����� �ΰ��� �ּҰ�����
		//toString �������̵��� �ϸ� �ΰ���  [KIND=spade, NUM=7]

		
	}

}
