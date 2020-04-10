/*
 User �����: Provider ������
 
 class A{}, class B{}
 ���� : A�� B�� ����մϴ�.
 
 1.��� : A extends B   >> A is a B.
 2.���� : AŬ���� �ȿ��� Member Field �� B�� ����ϴ°� >> class A{B b;}
        (�κа� ��ü)
------------------------------------------------------------        
class B{}       �ڵ����� ������      (�κа� ��ü ��   ��ü)
class A{
   int i;
   B b;  //A �� B�� ����մϴ�... ����...  A �ȿ��� A �� �����Ѱ�. 
   A(){
      b = new B();
    }    
 }       
 
 >> A a = new A(); >>A��ü�� ����� ���� B��ü�� ���� �����ȴ�.  
 A�� �������� B�� ��������.
 ----------------------------------------------------------
 class B{}        �б��� �л�����       (�κа� ��ü ��   �κ�)
class A{
   int i;
   B b;  //A �� B�� ����մϴ�... ����...
   A(B b){
     this.b = b;
    }    
 }       
 >> B b = new B();
 >> A a = new A(b);  //�б��� �л��� �ʿ��ϴٸ�.
 A�� �������� B�� �״��...
 ----------------------------------------------------------
class B{}       �̰� �ٷ� ��������.
class A{
   int i;
   //member field B��� Ÿ���� ������ ������ ����...
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
 
 **** parameter ���Ǵ� Ÿ���� �������****
 
 */
interface Icall{
	void m(); //public abstract ���� �Ȱ�. 
}

class D implements Icall{

	@Override
	public void m() {
		System.out.println("D Icall �������̽��� m() ����");
		
	}
	
}

class F implements Icall{

	@Override
	public void m() {
		System.out.println("F Icall �������̽��� m() ����");
		
	}
	
}

//interface �� Ȱ��  >>���뿡�� �����ϰ� ����§��... 
class C {
	void method(Icall ic) { //�Լ� ic ������ � Ÿ���� ��ü�� ���� �� ������� ~~~?     (F f) ���� �س��°� ������Ű�°Ŵ�. 
		ic.m();  //�߻��ڿ��� ���� �������̵��ϸ� �θ����� ���� �������̵� �Ѱ����ΰ�! �ϰ� ������������.
		
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
