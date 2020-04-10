/*
 User 사용자: Provider 제공자
 
 class A{}, class B{}
 관계 : A는 B를 사용합니다.
 
 1.상속 : A extends B   >> A is a B.
 2.포함 : A클래스 안에서 Member Field 로 B를 사용하는것 >> class A{B b;}
        (부분과 전체)
------------------------------------------------------------        
class B{}       자동차와 기어관계      (부분과 전체 중   전체)
class A{
   int i;
   B b;  //A 는 B를 사용합니다... 포함...  A 안에서 A 를 생성한것. 
   A(){
      b = new B();
    }    
 }       
 
 >> A a = new A(); >>A객체가 만들어 지면 B객체도 같이 생성된다.  
 A가 없어지면 B도 없어진다.
 ----------------------------------------------------------
 class B{}        학교와 학생관계       (부분과 전체 중   부분)
class A{
   int i;
   B b;  //A 는 B를 사용합니다... 포함...
   A(B b){
     this.b = b;
    }    
 }       
 >> B b = new B();
 >> A a = new A(b);  //학교에 학생이 필요하다면.
 A가 없어져도 B는 그대로...
 ----------------------------------------------------------
class B{}       이게 바로 의존관계.
class A{
   int i;
   //member field B라는 타입을 가지는 변수가 없다...
   void print(B b){}
   
   B print(){
   B b = new B();
   return B;
   }
 }
 >> B b = new B();
 >> A a = new A();
 >> a.print(b);
 >> B b2 = a.print(); 
 
 **** parameter 사용되는 타입을 직접명시****
 
 */
interface Icall{
	void m(); //public abstract 생략 된검. 
}

class D implements Icall{

	@Override
	public void m() {
		System.out.println("D Icall 인터페이스의 m() 구현");
		
	}
	
}

class F implements Icall{

	@Override
	public void m() {
		System.out.println("F Icall 인터페이스의 m() 구현");
		
	}
	
}

//interface 의 활용  >>현대에는 유연하게 대충짠다... 
class C {
	void method(Icall ic) { //함수 ic 변수는 어떤 타입의 객체를 받을 수 있을까요 ~~~?     (F f) 같이 해놓는건 고정시키는거다. 
		ic.m();  //추상자원에 대해 오버라이드하면 부모한테 가도 오버라이드 한곳으로가! 하고 내려보내진다.
		
	}
}

public class Ex05_User_Provider {

	public static void main(String[] args) {
		C c = new C();
		D d = new D();  //implements Icall
		F f = new F();  //implements Icall
		c.method(d); 
		c.method(f);

	}

}
