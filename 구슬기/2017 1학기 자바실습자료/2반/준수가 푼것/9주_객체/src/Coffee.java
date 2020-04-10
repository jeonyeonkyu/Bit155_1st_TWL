
public class Coffee {
	boolean isIce;
	String strMilk;
	
	
	public Coffee(){
		isIce =false;
		strMilk = "";
	}
	
	public Coffee(boolean a){
		isIce = a;
		a = true;
		

	}
	public Coffee(String a, boolean b){
		strMilk = a;
		isIce = b;
		b = false;
	}
		
	void make(){
		System.out.println("아메리카노 hot입니다.");
	}
	
	void make(boolean a){
		
			System.out.println("아메리카노 ice입니다.");
	}
	
	void make(String a){
		
			System.out.println("두유를 넣은 카페라떼 hot입니다.");
	}
	
	void make(String a, boolean b){
		if(a == "두유")
			{System.out.print("두유를 넣은 ");}
		else if(a == "우유")
			{System.out.print("우유를 넣은");}
		
		if(b == true)
			{System.out.println("카페라떼 ice입니다.");}
		else
			{System.out.println("카페라떼 hot입니다.");}
	}
	
	
}
