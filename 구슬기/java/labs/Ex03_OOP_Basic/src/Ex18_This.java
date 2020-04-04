/*
 This
  1.객체 자신을 가르키는 this(앞으로 생성될 객체의 주소를 담을 곳이라고 가정)
  2.this  객체자신(생성자 호출) : 원칙적으로 보면 >> 생성자는 객체가 만들어질때 1개만 호출
       하지만 예외적으로 this 를 활용하면 여러개의 생성자를 호출할수있다.   (Today Point)
        
 */
class Test6{
	int i;
	int j;
	Test6(){  //default constructor 기본 생성자
	
	}
	//설계자 입장에서 는
	//
//	//Test6(int i, int j){
//		i = i;
//		j = j;
//	}
//	Test6(int k, int p){  //문제점은 없어요 그치만, 가독성.. 되도록이면 파라메터 이름은 당신이 할당하려고 하는 instance variable 명과 동일하게..
//		i = k;            //개발할땐 의미있는 변수명 >>가독성 >>유지보수....코드를 봤을때 유추가되는게 있다.(대충 이렇게 돌아가겠구나! )
//		j = p;
//	}
	
	//변수명 구분하는 게 문제다... 변수와 파라메터값이 똑같기 때문에
	// int i;
	// int j;
	//parameter 받는  i, j 다르다는것을
	//this > Test6을 지칭.
	Test6(int i, int j){  
		//this.i >> Test6 가지고 있는 member
		this.i = i;
		this.j = j;
//		i = i;
//		j = j;
	}

}

class Book2{
	String bname;
	Book2(String bname){
		this.bname = bname;
	}
}



//Today point


class SoCar{
	String color;
	String geartype;
	int door;
	
	SoCar(){ //기본타입
		this.color = "red";
		this.geartype = "auto";
		this.door = 2;
	}
	SoCar(String color , String geartype , int door){
		this.color = color;
		this.geartype = geartype;
		this.door = door;
	}
	
	void print() {
		System.out.println(this.color + "/"+ this.geartype + "/" + this.door);
	}
	
}


public class Ex18_This {

	public static void main(String[] args) {
		Test6 t6 = new Test6(10,20);
		System.out.println(t6.i);
		System.out.println(t6.j);
		
		Book2 book = new Book2("홍길동전");
		
		SoCar socar = new SoCar();
		socar.print();
		
		SoCar socar2 = new SoCar("blue", "auto", 6);
		socar2.print();
		
				
		
		

	}

}
