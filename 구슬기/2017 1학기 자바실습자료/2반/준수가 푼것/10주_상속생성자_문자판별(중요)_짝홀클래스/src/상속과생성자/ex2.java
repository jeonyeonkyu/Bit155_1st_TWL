package ��Ӱ�������;

public class ex2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Pizza one = new Pizza(150,20000,4);
		Chicken two = new Chicken(200,15000,3);
		Pasta three = new Pasta(80,4000,2);
		Rice four = new Rice(90,1000,1);
		System.out.println("Pizza Ŭ������ ���� : "+one.PrintInfo());
		System.out.println("Chicken Ŭ������ ���� : "+two.PrintInfo());
		System.out.println("Pasta Ŭ������ ���� : "+three.PrintInfo());
		System.out.println("Rice Ŭ������ ���� : "+four.PrintInfo());
		
		int calsum = one.kcal + two.kcal + three.kcal + four.kcal;
		int kgsum = one.kg + two.kg + three.kg + four.kg;
		int pricesum = one.price + two.price + three.price + four.price;
		System.out.println("kcal�� �� : " + calsum + "kcal, price�� �� : " + pricesum + "��, kg�� �� : " + kgsum + "kg");
	}

}

class Food{
	private int kcal;
	private int price;
	private int kg;
	
	public Food(int kcal, int price, int kg){
		this.kcal = kcal;
		this.price = price;
		this.kg = kg;
	}
	
	public String PrintInfo(){
		String info =" [kcal=" + kcal + ", price=" + price + ", kg=" + kg + "]";
		return info;
	}
}

class Pizza extends Food{
	int kcal;
	int price;
	int kg;
	public Pizza(int kcal, int price, int kg){
		super(kcal,price,kg);
		this.kcal = kcal;
		this.price = price;
		this.kg = kg;
		PrintInfo();
	}
	public String PrintInfo(){
		return super.PrintInfo();
	}
}
class Chicken extends Food{
	int kcal;
	int price;
	int kg;
	public Chicken(int kcal, int price, int kg){
		super(kcal,price,kg);
		this.kcal = kcal;
		this.price = price;
		this.kg = kg;
		PrintInfo();
	}
	public String PrintInfo(){
		return super.PrintInfo();
	}
}
class Pasta extends Food{
	int kcal;
	int price;
	int kg;
	public Pasta(int kcal, int price, int kg){
		super(kcal,price,kg);
		this.kcal = kcal;
		this.price = price;
		this.kg = kg;
		PrintInfo();
	}
	public String PrintInfo(){
		return super.PrintInfo();
	}
}
class Rice extends Food{
	int kcal;
	int price;
	int kg;
	public Rice(int kcal, int price, int kg){
		super(kcal,price,kg);
		this.kcal = kcal;
		this.price = price;
		this.kg = kg;
		PrintInfo();
	}
	public String PrintInfo(){
		return super.PrintInfo();
	}
}