
public class Ex10_Static_Method {
	
	
	public void method() {   //method는  Ex10_Static_Method클래스가 갖고있는 기능이니까 클래스(Ex10_Static_Method)를 new 해줘야함.
		System.out.println("나 일반 함수야");
	}
	
	public static void smethod() {   //얘는 Class Area 에 있으니까 그냥 클래스 이름으로 접근하면 됨.
		System.out.println("나 static 함수야");
	}
	

	public static void main(String[] args) {
		//나 일반함수야를 출력해보세요\
		//java Ex10_Static_Method
		Ex10_Static_Method method = new Ex10_Static_Method(); 
		method.method();
		
		
		Ex10_Static_Method.smethod();//Ex10_Static_Method 클래스 이름 생략 가능


	}

}
