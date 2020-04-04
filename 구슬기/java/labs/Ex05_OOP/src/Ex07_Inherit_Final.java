/*
 변수 <-> 상수
 상수 : 한번 값이 초기화되면 변경불가능함
 상수자원: 고유값(ex주민번호), 수학적인 값 : pi=3.14159...
 상수는 관용적으로 [대문자]로 쓴다. 
 
 java : final int NUM =10;
 C#   : const int NUM =10;
 
 final 키워드
 클래스 앞에 >> final class Car{} >> final Math >> 상속불가
 함수 앞에 :public final void print(){} >>상속 >> 재정의 하지마 .
         public static final void print(){}
상수 :public final String KIND="heart" //상수         
 
 */
class Vcard{
	final String KIND="heart"; //한번 초기화화 된 값은 변경 불가능 하다
	final int NUM=10;
	
	void method() {
		//자바 API 시스템 상수 
		System.out.println(Math.PI);
	}
}
//Vcard 카드 53 장을 만들면 ...모든 카드 모양 >>KIND >> heart
//혹시 53장의 카드 KIND 다 다르게... 할수있을까? 만들어지면 바꾸지 않게 만들고싶다.

class Vcard2{
	final String KIND;//상수는 초기화를 강제하는데 초기화를 보장한다면 선언만하고 아래 생성자에서 보장할수있다. 이렇게하면 만들어지는 객체마다 다른걸 가지고 한번정하면 바꾸지 않아도된다.
	final int NUM;
/*	
      Vcard2(){
		this.KIND ="heart";
		this.NUM =10;
	}
*/
	//Vcard2(){}
	Vcard2(String kind , int num){
		this.KIND=kind;
		this.NUM =num;
	}
	@Override
	public String toString() {
		return "Vcard2 [KIND=" + KIND + ", NUM=" + NUM + "]";
	}
	
}



public class Ex07_Inherit_Final {

	public static void main(String[] args) {
		//Vcard v = new Vcard();
		//v.method();
		//v.NUM=1000; //The final field Vcard.NUM cannot be assigned.
		
		Vcard2 c = new Vcard2("spade",1);
		System.out.println(c.toString());
		Vcard2 c2 = new Vcard2("spade",2);
		System.out.println(c2.toString());
		Vcard2 c3 = new Vcard2("spade",3);
		System.out.println(c3.toString());
		
		
		
		//c.KIND = "heart"; //한번 초기화 된 값은 수정이 불가능하다 (상수)

	}

}
