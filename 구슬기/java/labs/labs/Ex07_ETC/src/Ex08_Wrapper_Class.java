import java.util.ArrayList;

/*
 8가지 기본타입(값타입) : JAVA API 가 제공
 
 8가지 기본타입에 대해서 객체 형태로 사용가능 하도록 만든것( wra[[er class)
 
 기본타입 때로는 객체 형태로 다루어 져야...
 1.매개변수로 객체가 요구될때
 2.기본형 값이 아닌 객체로 저장 되어야 할때
 3. 객체간 값비교가 필요할때.
 4. 타입 변환시 처리
 
 
 */
public class Ex08_Wrapper_Class {
	public static void main(String[] args) {
		int i= 100;
		Integer n = new Integer(500);  
		
		System.out.println("n : "+ n); //n : 500   //오버라이드 되어서 객체니까 주소값이나오는게 맞지만 ,,,,그게아닌 값이 나온다  오버라이딩 되어서.. toString() 같이 
		System.out.println(n.MAX_VALUE); //2147483647
		System.out.println(n.MIN_VALUE); //-2147483648
		
		
		//Point 활용
		//parameter 활용
		//generic
		ArrayList<Integer> li = new ArrayList<Integer>();
		li.add(100);
		li.add(200);
		for(int value : li) {
			System.out.println(value);
		}
		
		Integer i2 = new Integer(100); 
		Integer i3 = new Integer(100);
		System.out.println(i2 == i3); //주소값 비교 false
		System.out.println(i2.equals(i3)); //이건 실제 값 비교 true
		
		int i4 = 100;
		int i5 = 100;
		System.out.println(i4 == i5); //true
		
		Integer t = new Integer(500); //xx
		intMethod(t); //t 라는 참조변수가 가지는 값을 넘김 //500
		integerMethod(t); //t 라는 참조변수의 주소값을 넘김 // xx -> 500
		

	}
	static void integerMethod(Integer i) {//파라메터를 때로는 참조타입으로 쓸때가 있다....
		System.out.println("integer param : "+ i);  //값이나온다 왜? 오버라이드  //toString() 재정의 값 출력
		//System.out.println(i.MAX_VALUE);
		
	}
	static void intMethod(int i) {  //얘는 값타입이라서 . 을 눌러도 뜨는게 없다
		System.out.println("int param : "+ i);
		
	}
	

}
