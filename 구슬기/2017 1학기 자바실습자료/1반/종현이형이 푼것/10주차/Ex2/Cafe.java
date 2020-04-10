
public class Cafe {

	String strName;
	Coffee coffee;
	
	public Cafe(String strName){
		
		this.strName = strName;
	}
	
	public void cafeInfo(){
		System.out.println("HOLLYS 카페입니다.");
	}

	public void snowMenu() {
		// TODO Auto-generated method stub
		System.out.println("=========== 메뉴 ==========");
		System.out.println("1. 아메리카노(Hot/Ice)");
		System.out.println("2. 카페라떼(Hot/Ice)");
		System.out.println("=========================");
	}

	public void makeCoffee() {
		coffee = new Coffee();
		coffee.Info();
		
	}
	public void makeCoffee(boolean isIce ){
		coffee = new Coffee();
		coffee.Info(isIce);
	}
	public void makeLatte(String strName){
		coffee = new Coffee();
		coffee.Info(strName);
		
	}
	public void makeLatte(String strName, boolean isIce ){
		coffee = new Coffee();
		coffee.Info(strName, isIce);
}
	
}
class Coffee{
	
	boolean isIce = true;
	String strMilk;
	
	public Coffee(){
	}
	public Coffee(boolean isIce){
	}
	public Coffee(String strName, boolean isIce){
		this.strMilk = strName;
	}
	
	public void Info() {
		System.out.println("아메리카노(Hot)입니다.");
	}
	public void Info(boolean isIce) {
		System.out.println("아메리카노(Ice)입니다.");
	}
	public void Info(String strMilk){
	System.out.println(strMilk+"를 넣은 카페라떼(Hot)입니다.");
	}
	public void Info(String strMilk, boolean isIce) {
			System.out.println(strMilk+"를 넣은 카페라떼(Ice)입니다.");

		}
		
	}

