/*
 1. ��ü �ڽ��� ����Ű�� this
 2. this ����ϸ� �ٸ� �����ڸ� ȣ��
 ��Ģ ; �����ڴ� ��ü������ 1���� ȣ��
 this.. �ѹ��� �������� �����ڸ� ȣ���Ҽ��ִ�.
 */
//Zcar car = new Zcar();
//Zcar car = new Zcar("blut","aute",4);

class Zcar{
	String color;
	String geartype;
	int door;
	
	Zcar(){ //�⺻Ÿ��
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

///////////////////�ڵ差����( ������ >> this Ȱ������)
class Zcar2{
	String color;
	String geartype;
	int door;
	
	Zcar2(){ //�⺻Ÿ��
//		this.color = "red";
//		this.geartype = "auto";
//		this.door = 2;
		
		System.out.println("default constructor");
	}
	Zcar2(String color , int door){
		this(color,"auto",door);
		System.out.println("overloading constructor param2��");
		
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
//��µǴ� ������ ����.

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
