/*
 1. 객체 자신을 가리키는 this
 2. this 사용하면 다른 생성자를 호출
 원칙 ; 생성자는 객체생성시 1개만 호출
 this.. 한번에 여러개의 생성자를 호출할수있다.
 */
//Zcar car = new Zcar();
//Zcar car = new Zcar("blut","aute",4);

class Zcar{
	String color;
	String geartype;
	int door;
	
	Zcar(){ //기본타입
//		this.color = "red";
//		this.geartype = "auto";
//		this.door = 2;
		this("red","auto",2);
		System.out.println("default constructor");
	}
	Zcar(String color , String geartype , int door){
		this.color = color;
		this.geartype = geartype;
		this.door = door;
		
		System.out.println("overloading constructor");
		}
	
	void print() {
		System.out.println(this.color + "/"+ this.geartype + "/" + this.door);
	}
	
}

///////////////////코드량감소( 생성자 >> this 활용으로)
class Zcar2{
	String color;
	String geartype;
	int door;
	
	Zcar2(){ //기본타입
//		this.color = "red";
//		this.geartype = "auto";
//		this.door = 2;
		
		System.out.println("default constructor");
	}
	Zcar2(String color , int door){
		this(color,"auto",door);
		System.out.println("overloading constructor param2개");
		
		System.out.println("overloading constructor");
		}
	Zcar2(String color , String geartype , int door){
		this.color = color;
		this.geartype = geartype;
		this.door = door;
		
		System.out.println("overloading constructor");
		}
	
	void print() {
		System.out.println(this.color + "/"+ this.geartype + "/" + this.door);
	}
	
}
//출력되는 순서를 알자.

public class Ex19_This_constructor {

	public static void main(String[] args) {
//		Zcar car = new Zcar();
//		car.print();
//		
//		Zcar car2 = new Zcar("yellow","auto",1);
//		car2.print();
		Zcar2 z  = new Zcar2();
		z.print();
		
		
		

	}

}
