package kr.or.bit;
//디자인 패턴(생성패턴) >> new >> 객체를 만드는 방법
//객체 하나를 만들어서 공유.....하겠따.?
//회사에 가면 공유프린터, 


//싱글톤을 통해서 내가 보장 받을수 있는것?
//객체의 주소가 항상 동일하다. >>  하나의 객체를 공유하겠다..   독자적인 뉴를 막음으로써 하나 초과해서 만들수 없다.   


//활용은 JDBC에서 한다.  JDBC란?  JAVA하고  DB사이의 인터페이스 역할을 하는것.  JAVA <- (JDBC:CRUD)  -> DB

//p라는 변수를 메모리에 올리고 p라는 변수가 null값이면 객체를 메모리에 올린다. 

//main
//Singleton singleton = new Singleton() //객체를 만들때 뉴 뒤에 생성자를 호출해서 만든다.  >>노출(private) 

public class Singleton {
	private static Singleton p; //막았는데 메모리에 올라가는데??  메모리에 올라가도 private 이라 쓸수 없음. 
	
	
	private Singleton() { //생성자(default)  //직접객체생성불가..
		
	}
	
	public static Singleton getInstance() {
		if(p == null) { //첨엔 당연히 null값임
			p = new Singleton(); //singleton = new Singleton();
			                     //class 클래스 내부에서는 public, private 구분하지 않아요!
		}
		return p;
	}

}
