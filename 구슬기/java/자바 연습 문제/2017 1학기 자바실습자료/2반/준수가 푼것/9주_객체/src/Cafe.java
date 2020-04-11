
public class Cafe {
	String strName;
	Coffee coffee = new Coffee();
	public Cafe(String a){
		strName = a;
	}
	void cafeInfo(){
		System.out.println(strName +"카페입니다.");
	}
	void showMenu(){
		System.out.println("====메뉴====");
		System.out.println("1.아메리카노 (아이스/핫)");
		System.out.println("2.카페라떼 (아이스/핫)");
		System.out.println("==========");
	}
	void makeCoffee(){
		coffee.make();
	}
	void makeCoffee(boolean b){
		coffee.make(true);
	}
	void makeLatter(String a){
		coffee.make(a);
	}
	void makeLatter(String a,boolean b){
		coffee.make(a,true);
		
	}
	
}
