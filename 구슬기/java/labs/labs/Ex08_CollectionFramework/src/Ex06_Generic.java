import java.util.ArrayList;
import java.util.Stack;

/*
 아무리 강조해도 지나침이 없다.
 Generic     --큰그릇에 작은 음식담는것같은 낭비를 막기위해..
 jdk 1.5 부터 있다.
 C# ,java 필수 기능... 
 
 Collection 클래스들은(저장공간의 타입 :Object) -모든걸 다 넣을 수 있다. 다만 꺼낼때 힘드릭때문에 제너릭을 쓰면 좋다.
 1. Object 타입 저항 >> 타입 ? >> 타입을 가제하면 어떨까? 하고 붙인게 제너릭
 2. 타입의 안정성(타입 강제)   하면서 안정성과 가독성을 얻게된다.
 3. 형변환 자체를 없애준다.  ex) (car)obj 이런거...       Object 로 꺼내면 계쏙 다운캐스팅을 해워야하는데   그걸 안해도됨!!!!
 
 만드는 시점 : 클래스 설계할때 타입을 강제하도록 설계함
 
 */
class MyGen<T>{ //Type parameter
	T obj;
	
	void add(T obj) {
		this.obj = obj;
	}
	T get() {
		return this.obj;
	}
}
class Person extends Object{
	int age=100;
}

public class Ex06_Generic {
	public static void main(String[] args) {
		MyGen<String> mygen = new MyGen<String>(); //객체를 만들때 당신이 필요한 타입을 강제 할 수 있다. 
		mygen.add("문자열");
		
		String result = mygen.get();
		System.out.println(result);
		
		System.out.println("--------------------------------------------------");
		//제너릭 없이 해본것
		ArrayList list = new ArrayList(); //저장하는 저장공간(Array >> 타입 >>default object)
		list.add(10);
		list.add(new Person());
		list.add("홍길동"); //Object 라서 걍 인트, 참조, 스트링 다들어감
		
		//출력
		for(Object obj : list) {
			//System.out.println(obj);   //객체는 주소값이 나온다.   
//			Person P = (Person)(obj); //이러면 객체외의 값들이 안나온다.
//			System.out.println(.obj);
			//판단(객체, 값 구분,,, 형변환까지 해야된다)
			if(obj instanceof Person) { //obj 라는 객체가 펄슨 타입이라면
				Person p = (Person)(obj);
				System.out.println(p.age);
			}else {
				System.out.println(obj);   //이렇게 까지해야 다 꺼낼수 있다.
			}
		}
		System.out.println("--------------------------------------------------");
		//제너릭사용
		ArrayList<Person> plist = new ArrayList<Person>();  //Person 타입으로 제한해둠
		plist.add(new Person());
		plist.add(new Person());
		for(Person p : plist) {
			System.out.println(p.age);
		}
		
		System.out.println("--------------------------------------------------");
		
		//MyGen 도 제너릭사용~
		MyGen<Person> myobj = new MyGen<Person>();
		myobj.add(new Person());
		Person pe = myobj.get();
		System.out.println(pe.age); //100
		
		System.out.println("--------------------------------------------------");
		//Stack 도 제너릭사용   --연습필요!
		Stack<String> s = new Stack<String>();
		s.push("문자열");
		String str = s.pop(); //튀어나오는 값이 String 이니까 String 변수에 담아준다.
		System.out.println(str);
		
		
				

	}

}
