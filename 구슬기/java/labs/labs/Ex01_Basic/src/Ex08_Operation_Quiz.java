import java.util.Scanner;

/*
 간단한 사칙 연산기 (+ ,-, *, /)
 입력값 3개 (입력값은 nextLine() 받아서 필요하다면 숫자 변환)
 목적  : Integer.parseInt(), **equals()활용**
 화면
 >입력값 : 숫자
 >입력값(기호): +
 >입력값:숫자
 >연산결과 :200
 
  ---------
  스캐너는 객체의 주소값을 가진 변수
 /내가 데이터를 어디 담을건가
  * 계산을위해 필요한 유틸리티가 무엇인가
  * 그리고 변수를 만든다.
  * 계산기를 실행할때 담을정보를 고민하고 변수들을 초기화해놓는다.
  * 문자열의 비교는 == 아니고(X)    .equals
  *     
 */





	import java.util.Scanner;

	/*
	간단한 사칙 연산기 (+ , - , * , /)
	입력값 3개 (입력값은 nextLine() 받아서 필요하다면 숫자 변환)
	목적 : Integer.parseInt() ,  **equals() 활용**
	화면
	>입력값:숫자
	>입력값(기호): +
	>입력값:숫자 
	>연산결과 :200

	-------------
	>입력값:100
	>입력값(기호): -
	>입력값:100
	>연산결과 :0


	*/
	public class Ex08_Operation_Quiz {

		public static void main(String[] args) {
			/*
		   ■ if문은 조건값이 boolean형, switch문은 정수형(byte, short, int)과 문자형(char), 문자열(String)
	       ■ long, boolean, float, double형 사용 불가
	       
	       
		    내가 실수한것.
			Scanner sc = new Scanner(System.in);
			char ch =   sc.nextLine().charAt(0);
	       	switch (ch) {
			case '+':System.out.println("+ 입니다");
				break;
			default: System.out.println("다른 문자 입니다");
				break;
			}
			
			
			Scanner sc = new Scanner(System.in);
			String ch =   sc.nextLine();
	       	switch (ch) {
			case "+":System.out.println("+ 입니다");
				break;
			default: System.out.println("다른 문자 입니다");
				break;
			}
			*/
			
			
			
			String opr="";//문자열 초기화
		    int input_1=0;
	 	    int input_2=0;
	  	    int result=0;
	  	    Scanner sc = new Scanner(System.in);
	        
	  	    
			  System.out.print("숫자입력: ");
			  input_1 = Integer.parseInt(sc.nextLine());
			  
				  
			  System.out.print("연산기호(+,-,*,/): ");
			  opr = sc.nextLine();

			  System.out.print("숫자입력: ");
			  input_2 = Integer.parseInt(sc.nextLine());

			  
			  
			  if(opr.equals("+")) {  //POINT 문자열의 비교는 == 아니고 (x) , equals (String)
				  result = input_1 + input_2;
				  
			  }else if(opr.equals("-")) {
				  result = input_1 - input_2;
				  
			  }else if(opr.equals("*")) {
				  result = input_1 * input_2;
				  
			  }else if(opr.equals("/")) {
				  result = input_1 / input_2;
			  }else {
				  System.out.println("지원하지 않는 연산자 입니다");
				  //key point (여기서는 main 함수)
				  //return 키워드 :  [함수단위]의 종결자  > main 함수 탈출 > 종료
				  return;
				 
				  //System.exit(0); //강제적인 프로그램 종료
				  
			  }
			  
			  System.out.printf("[%d %s %d = %d]",input_1,opr,input_2,result);
			  
			  //설계도 안의 것들은 자원들이라고 하고, 멤버필드라고하고, 기능을 하는 것들은 펑션, 메소드 라고 한다.
			  //EmP라는 녀석은 멤버를 가지고 있따. 하위요소 같은것 이름 직종 등등 
			  
		}
}
