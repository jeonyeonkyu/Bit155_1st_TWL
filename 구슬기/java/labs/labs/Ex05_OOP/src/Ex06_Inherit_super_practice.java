class Basea{
	String basename;
	Basea(){
		System.out.println("Base �⺻ ������ �Լ�                �ȳ�");
	}
	Basea(String basename){
		this.basename = basename;
		System.out.println("basename : �� �θ��ž�?" +this.basename+"�ݰ���");
	}
	void method() {
		System.out.println("�θ� method");
	}
}

class Deriveda extends Basea{
	String dname;
	Deriveda(){
		System.out.println("Derived �⺻ ������ �Լ�                  �ȳ�");
	}
	Deriveda(String dname){
		super(dname);
		this.dname =dname;
		System.out.println("dname "+ this.dname+"�ݰ���");
	}
	@Override
	void method() {
		System.out.println("�ڽ� method");
	}
	
	void method(String d) {
		System.out.println(d);
	}
	
	void p_method() {
		super.method();
	}
}

public class Ex06_Inherit_super_practice {
	public static void main(String[] args) {
	 Deriveda d = new Deriveda();
//	 Base �⺻ ������ �Լ�
//	 Derived �⺻ ������ �Լ�
	 
	 Deriveda d2 = new Deriveda("yes");
//	 basename : �� �θ��ž�?yes
//			 dname yes
	 d.p_method();
	 d.method();
	 d.method("�� �� -�ڽ�- �����ε� ������ �̾Ҿ�. ");
	 
	 Deriveda d3 = new Deriveda();
	 Deriveda d4 = new Deriveda("���� �ȳ� ");
	 
	}

}
