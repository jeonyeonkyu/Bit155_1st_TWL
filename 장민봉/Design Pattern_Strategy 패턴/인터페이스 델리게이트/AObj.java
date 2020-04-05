
public class AObj {
	Ainterface ainterface;
	
	public AObj() {
		ainterface = new AinterfaceImpl();
	}
	public void myFunction() {
		//위임
		ainterface.myfunction();
	}

}
//myFunction이라는 기능이 필요한 다른 AObj객체 가있을때 이미같은 기능을 AinterfaceImpl클래스에 정의해두었기에
//AObj객체생성할때 Ainterface맴버 변수에 AinterfaceImpl객체를 담는다. 
//그러면 결국 AObj객체의 myFunction메소드는 Ainterface구현객체의 기능을 실행하는 것이다 이것을 델리게이트라고한다.
