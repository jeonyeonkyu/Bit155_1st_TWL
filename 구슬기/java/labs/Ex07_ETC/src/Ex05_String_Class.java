/*
 String 클래스
  String str = new String("홍길동");
  8가지 기본 타입과 동일하게 사용할 수 있도록 설계
  int i = 100;
  String str= "홍길동";
  
  1.String 클래스 : 데이터 저장 구조: char[] 배열저장 > 홍길동 > [홍][길][동] 이렇게 내부적으로는 관리한다.
  ex) String ename = "ABC">> char [] >> [A][B][C]
  class String extends object{
      char[] ...
      void length(){}
      @override
      String toString(){
                재정의......
      }          
  }
  
 */
public class Ex05_String_Class {

	public static void main(String[] args) {
		String str = "홍길동";
		System.out.println(str.length());  //3      //데이터를 char[]로 가지고 있으니까 
		System.out.println(str.toString()); //홍길동 //재정의 
		
		String str1 = "AAA";
		String str2 = "AAA";
		
		//equals 를 쓰는 이유??  
		
		System.out.println(str1); //str1.toString()  동일
		System.out.println(str1.toString());
		System.out.println(str1 == str2); //true //String은 같은 문자열이 있으면 heap에 새로 생성하지 않는다. 그래서 true 
		//문자열 == 은 무엇을 비교하나?  주소값 비교("xx번지"=="xx번지")
		//실제 : 문자열 값이지.. 주소물어보고싶은게 아닌디 (x)
		System.out.println(str1.equals(str2)); //true 
		//***** 실제로 heap 에 있는 값을 비교 ("AAA" == "AAA")
		
		//그런데.. 스트링을 만드는 정상적인 방법으로 하면
		String str3 = new String("BBB"); //new 사용하면 heap에 새로운 객체를 생성 
		String str4 = new String("BBB"); //같은 문자열이어도 new가 있어서 새로 만든다.
		System.out.println(str3 == str4); //false //주소가 다르기때문에  "xx번지" == "yy번지" >>false
		System.out.println(str3.equals(str4));// true  //"BBB" =="BBB" >>true
		
		//넌센스
		String s = "A";
		s+= "B";
		s+= "C";
		System.out.println(s); //ABC
		
		s="A";
		System.out.println(s); //A
		

	}

}
