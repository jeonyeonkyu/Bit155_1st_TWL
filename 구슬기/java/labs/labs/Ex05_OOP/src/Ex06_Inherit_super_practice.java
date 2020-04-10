class Basea{
	String basename;
	Basea(){
		System.out.println("Base 기본 생성자 함수                안녕");
	}
	Basea(String basename){
		this.basename = basename;
		System.out.println("basename : 나 부른거야?" +this.basename+"반가워");
	}
	void method() {
		System.out.println("부모 method");
	}
}

class Deriveda extends Basea{
	String dname;
	Deriveda(){
		System.out.println("Derived 기본 생성자 함수                  안녕");
	}
	Deriveda(String dname){
		super(dname);
		this.dname =dname;
		System.out.println("dname "+ this.dname+"반가워");
	}
	@Override
	void method() {
		System.out.println("자식 method");
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
//	 Base 기본 생성자 함수
//	 Derived 기본 생성자 함수
	 
	 Deriveda d2 = new Deriveda("yes");
//	 basename : 나 부른거야?yes
//			 dname yes
	 d.p_method();
	 d.method();
	 d.method("부 모 -자식- 오버로딩 순으로 뽑았어. ");
	 
	 Deriveda d3 = new Deriveda();
	 Deriveda d4 = new Deriveda("나도 안녕 ");
	 
	}

}
