
public class Cafe {

	String strName;
	Coffee coffee;
	
	public Cafe(String strName){
		
		this.strName = strName;
	}
	
	public void cafeInfo(){
		System.out.println("HOLLYS ī���Դϴ�.");
	}

	public void snowMenu() {
		// TODO Auto-generated method stub
		System.out.println("=========== �޴� ==========");
		System.out.println("1. �Ƹ޸�ī��(Hot/Ice)");
		System.out.println("2. ī���(Hot/Ice)");
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
		System.out.println("�Ƹ޸�ī��(Hot)�Դϴ�.");
	}
	public void Info(boolean isIce) {
		System.out.println("�Ƹ޸�ī��(Ice)�Դϴ�.");
	}
	public void Info(String strMilk){
	System.out.println(strMilk+"�� ���� ī���(Hot)�Դϴ�.");
	}
	public void Info(String strMilk, boolean isIce) {
			System.out.println(strMilk+"�� ���� ī���(Ice)�Դϴ�.");

		}
		
	}

