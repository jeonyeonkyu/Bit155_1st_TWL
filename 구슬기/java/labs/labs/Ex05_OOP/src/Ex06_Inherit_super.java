/*
 
 this : 객체 자신을 가리키는 this (this.empno, this.ename)
 this : 생성자를 호출하는 this (this(100,"홍길동"))
 
 상속
 부모 : 자식
 super(현재 자식이 부모에게 접근 할수있는 주소값) : 상속관계에서 부모에게 접근가능한 유일한 방법. super (부모의 주소)
 
 super   Ex06_Inherit_super 인 이유는 상속이있어야 있는 것들을 설명하는 거라서
 1. 상속관계에서  부모자원 접근(자식)
 2. 상속관계에서 부모의 생성자를 호출 명시적으로..
 
 C# >> base()
 
 */

class Base{
	String basename;
	Base(){
		System.out.println("Base 기본 생성자 함수");
	}
	Base(String basename){
		this.basename =basename;
		System.out.println("basename: 나부른거야?"+ this.basename);
	}
	void method() {
		System.out.println("부모 method");
	}
}
class Derived extends Base{
	String dname;
	Derived(){
		System.out.println("Derived 기본 생성자 함수");
	}
	
	Derived(String dname){
		//자식입장에서 부모쪽 제어 하고 싶음, 부모의 주소가 필요하다
		super(dname); //부모쪽의 overloading 생성자호출  23번
		this.dname =dname;
		System.out.println("dname: "+ this.dname);
	}
	@Override
	void method() {
		System.out.println("자식 method"); 
	}
	// 어느날 부모의 메소드 함수가 그리운데 난 이미 재정의 를 해놓은 상태다. 
	// 이럴때 유일한 방법이  : super(자식의 함수 내에서만 사용가능)
	
	void p_method() {
		super.method();
	}
}

public class Ex06_Inherit_super {

	public static void main(String[] args) {
		Derived d = new Derived("Hello"); //슈퍼를 사용하면 부모의 자원에 접근할수있따.
		d.method();
		d.p_method();

	}

}
