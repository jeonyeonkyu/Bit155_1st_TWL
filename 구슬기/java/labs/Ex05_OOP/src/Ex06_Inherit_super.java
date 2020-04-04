/*
 
 this : ��ü �ڽ��� ����Ű�� this (this.empno, this.ename)
 this : �����ڸ� ȣ���ϴ� this (this(100,"ȫ�浿"))
 
 ���
 �θ� : �ڽ�
 super(���� �ڽ��� �θ𿡰� ���� �Ҽ��ִ� �ּҰ�) : ��Ӱ��迡�� �θ𿡰� ���ٰ����� ������ ���. super (�θ��� �ּ�)
 
 super   Ex06_Inherit_super �� ������ ������־�� �ִ� �͵��� �����ϴ� �Ŷ�
 1. ��Ӱ��迡��  �θ��ڿ� ����(�ڽ�)
 2. ��Ӱ��迡�� �θ��� �����ڸ� ȣ�� ���������..
 
 C# >> base()
 
 */

class Base{
	String basename;
	Base(){
		System.out.println("Base �⺻ ������ �Լ�");
	}
	Base(String basename){
		this.basename =basename;
		System.out.println("basename: ���θ��ž�?"+ this.basename);
	}
	void method() {
		System.out.println("�θ� method");
	}
}
class Derived extends Base{
	String dname;
	Derived(){
		System.out.println("Derived �⺻ ������ �Լ�");
	}
	
	Derived(String dname){
		//�ڽ����忡�� �θ��� ���� �ϰ� ����, �θ��� �ּҰ� �ʿ��ϴ�
		super(dname); //�θ����� overloading ������ȣ��  23��
		this.dname =dname;
		System.out.println("dname: "+ this.dname);
	}
	@Override
	void method() {
		System.out.println("�ڽ� method"); 
	}
	// ����� �θ��� �޼ҵ� �Լ��� �׸�� �� �̹� ������ �� �س��� ���´�. 
	// �̷��� ������ �����  : super(�ڽ��� �Լ� �������� ��밡��)
	
	void p_method() {
		super.method();
	}
}

public class Ex06_Inherit_super {

	public static void main(String[] args) {
		Derived d = new Derived("Hello"); //���۸� ����ϸ� �θ��� �ڿ��� �����Ҽ��ֵ�.
		d.method();
		d.p_method();

	}

}
