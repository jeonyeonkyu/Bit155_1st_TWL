import java.util.Scanner;

public class Ex07_printf_format {

	public static void main(String[] args) {
		//Java : System.out.println();
		//C# : Console.WriteLine();
		
		System.out.println();   //ln =new line 다음줄로 넘겨라(줄바꿈)
		System.out.print("A");
		System.out.print("B");
		System.out.println("C");
		System.out.println("D");
		
		int num = 100;
		System.out.println(num);
 		System.out.println("num 값은 : " + num + "입니다");
 		//출력하는 형식을 정해보는것: 형식format
 		System.out.printf("num 값은: %d 입니다 \n",num);  //  %d 자리가 구멍이다.
 		//format 형식 문자 (약속)
 		// %d (10진수 형식의 정수) 값을 >> d라는 자리에 넣어라
 		// %f (실수)
 		// %s (문자열)
 		// %c (문자)
 		// \t  tab , \n enter(줄바꿈)
 		System.out.printf("num 값은 [%d] 입니다 그리고 [%d] 도 있어요 \n",num , 5555); //d 자리에 콤마 이후의 것을 순서대로 넣는것같음
 		
 		float f = 3.14f;  //(명시적 변환)
 		System.out.println(f);
 		System.out.printf("f 변수값은 %f 입니다 \n" , f);
 		
 		//반대로
 		//cmd  (console) 창에서 데이터 입력 받기
 		//java.util.Scanner 
 		Scanner sc = new Scanner(System.in);
 		//단축키...
 		//ctrl + shift + o  >> import 구문 자동 생성하기
 		//System.out.println("값을 입력하세요");
 		//String value = sc.nextLine();  //입력하고 엔터 할때까지 대기.....문자열로 반환
 		//System.out.println(value);
 		
 		//int number = sc.nextInt();
        //System.out.println("정수값 : " + number);
 
        //float fnumber = sc.nextFloat();
        //System.out.println("실수값 : " + fnumber);
        
        //권장사항 : nextInt , nextFloat 보다는 nextLine() 으로 사용하자
        //Today Point
        //[문자를 -> 숫자로 (정수,실수 )]
        //Integer.parseInt("11") 문자열을 정수로
        //Float.parseFloat("3.111") 문자열을 실수로
        //Double.parseDouble(s)
        
 		
 		//System.out.println("숫자 입력하세요");
 		//int num2 = sc.nextInt();
 		//System.out.println("정수값 : " + num2);
 		System.out.println("문자 입력하세요");
 		int str2 =Integer.parseInt(sc.nextLine());
 		System.out.println("문자값: "+str2+1);
 		
 		//화면에 출력하는걸 다르게 하는것
 		//어떤 자리에 포멧하는것
 		//값을 입력하는방법
 		//스캐너로 값을 입력하기전까지는 멍춰있는것 
 		//넥스트라인으로 받아서 필요한 형태로 파일을 바꾸자. 이렇게 연습하는것이 플러스가 되더라.
 		
 		
 		//Tip
 		//숫자를=> 문자로
 		String data = String.valueOf(10000);
 		System.out.println(data);
 		
 		
 		
 		
 		
 		
	}

}
