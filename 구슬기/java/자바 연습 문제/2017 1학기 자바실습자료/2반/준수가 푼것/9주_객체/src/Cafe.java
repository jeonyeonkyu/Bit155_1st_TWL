
public class Cafe {
	String strName;
	Coffee coffee = new Coffee();
	public Cafe(String a){
		strName = a;
	}
	void cafeInfo(){
		System.out.println(strName +"ī���Դϴ�.");
	}
	void showMenu(){
		System.out.println("====�޴�====");
		System.out.println("1.�Ƹ޸�ī�� (���̽�/��)");
		System.out.println("2.ī��� (���̽�/��)");
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
