import java.util.Scanner;

public class 연습 {

	public static void main(String[] args) {
		// Systme.out.println("Hello World");
		// 클래스 >> 설계도
		/*
		 * //변수란? 데이터를 담을수 있는 공간의 이름 //변수가 선언되는 위치 (scope 유효범위) 1. instance variable :
		 * 객체변수 2. local variable : 지역변수 (함수안에있는 변수) 3.함수안에 if, 블럭 for 블럭 안에 있는 변수도 지역변수
		 * 블럭안에서 유효 4.static variable : 공유변수(자원) : 객체간 공유자원
		 * 
		 * 클래스는 설계도이다
		 * 
		 * 
		 */
		String str = "홍길동";
		int age = 100;

		Car c;

		c = new Car();
		System.out.println(c);

		Car c2 = new Car();
		System.out.println(c == c2); // 주소가 다르니 false

		long num2 = 100;
		long num3 = 10000000000000L;
		System.out.println(num3);

		long p = 1000000000001L;
		char single = '가';
		System.out.println(single);
		char ch = 'A';
		System.out.println(ch);

		int intch = 'A';
		System.out.println(intch);
		System.out.println("int(ch) : " + ch);

		int ch2 = 65;
		System.out.println((char) ch2);

		int intvalue = 161389656;
		byte bytevalue = (byte) intvalue;
		System.out.println(bytevalue);

		String name = "hello world";
		System.out.println(name);

		String name2 = "반갑습니다앙" + name;
		System.out.println(name2);

		char sing = '\'';
		System.out.println(sing);

		String name3 = "구\"슬\"기";
		System.out.println(name3);

		String str3 = "10";
		String str4 = "100";

		String result = str3 + str4;
		System.out.println(result);

		// C:\temp 화면에 출력하세요 (String 변수에 넣고 화면 println 출력)

		String str5 = "C:\\temp";
		System.out.println(str5);

		float f = 3.15f;
		float f2 = 1.123456789123456789f;
		System.out.println(f2);

		byte q = (byte) 128;
		System.out.println(q);

		// -----------------Ex04 복습
		/*
		 * 설계도 클래스는 2가지로 만들 수 있음 1.main 함수를 가진 설계도-자체적으로 실행가능함 2.main 함수가 없는 설계도-도와주는
		 * 역할, 라이브러리 참조파일이라고 함
		 * 
		 */
		// -----------------Ex05복습

		int i = 9;
		int j = 13;
		int result2 = i + j++;
		System.out.println(result2 + "  j :" + j);

		// 정수의 모든 연산은 int 로 변환 후 계산됩니다.
		// 실수의 모든 연산은 double 로 변환후 계산됩니다.

		byte b = 100;
		byte c3 = 1;
		byte g = (byte) (b + c3); // 괄호로 전체를 감싼후 명시변환 해야함
		int h = b + c3;
		System.out.println("g :" + g + "  h :" + h);

		float num4 = 10.45f;
		int num5 = 20;
		int result5 = (int) (num4 + num5);
		System.out.println(result5);
		float result6 = num4 + num5;
		System.out.println(result6);

		char c4 = '!';
		char c5 = '!';
		int result7 = c4 + c5;
		System.out.println(result7);
		System.out.println((char) result7);

		for (h = 0; h < 10; h++) {
			System.out.println((h) * 2);
		}

		for (g = 0; g < 10; g++) {
			if (g == 5)
				break;
		}
		System.out.println(g);

		int sum = 0;
		sum += 1;
		sum -= 1;
		System.out.println(sum);

		int score = 96;
		String grade = "";
		System.out.println("당신의 점수는 :" + score);
		if (score >= 90) {
			grade = "A";
			if (score >= 95) {
				grade += "+";
			} else {
				grade += "-";
			}
		} else if (score >= 80) {
			grade = "B";
			if (score >= 85) {
				grade += "+";
			} else {
				grade += "-";
			}
		} else if (score >= 70) {
			grade = "C";
			if (score >= 75) {
				grade += "+";
			} else {
				grade += "-";
			}
		} else {
			grade = "F";
		}
		System.out.println("당신의 학점은 : " + grade);

		int data = 70;
		switch (data) {
		case 100:
			System.out.println("100입니다.");
			break;
		case 90:
			System.out.println("90입니다.");
			break;
		case 80:
			System.out.println("80입니다.");
			break;
		case 70:
			System.out.println("70입니다.");
			break;
		default:
			System.out.println("default");
		}
		
		int month = 2;
		String res = "";
		switch(month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12: res= "31";
		      break;
		
		
		case 4:
		case 6:
		case 9:
		case 11:    res= "30";
			break;
		
		case 2:     res= "29";
			
		}
		System.out.println(month + " 이번 달의 일수는 " +res );
		
		
		System.out.println("Math.random() :" + (int)(Math.random()*10+1));
		
		
		int data1 = ((int)(Math.random()*10 +1))*100;
		String msg = "";
		msg += "추첨번호는 :" + data1 + "이고 경품은";
		switch(data1) {
		case 1000 : msg+= "Tv";
		case 900:   msg+= " Notebook";
		case 800:   msg += " Airpods";
		case 700:   msg += " E-bookPackage";
		case 600:   msg += " Book";
		break;
		default :   msg += "nothing";
		}
		System.out.println(msg);
		
		
		// -----------------Ex07복습
		
		int num = 100;
		System.out.printf("num 값은 : %d 입니다 \n", num);
		//%d 10진수 형식의 정수 값을>>d라는 자리에 넣어라.
		//%f 실수
		//%s 문자열
		//%c 문자
		// \t tab, \n enter
		System.out.printf("num 값은 [%d]입니다. 그리고 [%d]도 있어요 .\n", num , 5555);
		
		
		
		//클래스란? 어떤 기능을 제공하는 것
		Scanner scanner = new Scanner(System.in);
//		int num1 = scanner.nextInt(); //nextInt >> 정수
//		int num21 = scanner.nextInt(); //nextFloat >>실수
//		                              //괄호안에 입력하는 값이 num1이 된다
//		System.out.println(num1); 
//		System.out.println(num21);

//		String input = scanner.nextLine(); //괄호안에 입력하는 내용이 input이 된다
//		int num = Integer.parseInt(input);//문자열(input)을 숫자(num11)으로 변환
//		
//		String input = scanner.nextLine();
//		String input = "3";
//		int num31 = Integer.parseInt(input);
//		System.out.println(num31);
    
		
		//      Ex_08 간단한 사칙 연산기
		
		
		String opr = "";
		int input_1=0;
		int input_2=0;
		int result8=0;
		Scanner sc = new Scanner(System.in);
		
		System.out.print("숫자입력: ");
		input_1 = Integer.parseInt(sc.nextLine());
				
		System.out.print("연산기호(+,-,*,/): ");
		opr = sc.nextLine();
		
		System.out.print("숫자입력: ");
		input_2 = Integer.parseInt(sc.nextLine());
		
		
		if(opr.equals("+")) {
			result8 = input_1 + input_2;			
		}else if(opr.equals("-")) {
			result8 = input_1 + input_2;
		}else if(opr.equals("*")) {
			result8 = input_1 + input_2;
		}else if(opr.equals("/")) {
			result8 = input_1 + input_2;
		}else {
			System.out.println("지원하지 않는 연산자 입니다");
			
			return;
		}
		System.out.printf("[%d %s %d= %d]" ,input_1,opr,input_2,result8);
		
		
		
	for(int s = 1 ; s <= 10 ; s++) {
			
			for(int v =0 ; v <=9  ; v++) {
				System.out.printf("%d\t",s+v);
			}
			System.out.println();
		}		
	
	//동물원
	int age2 = 0;
	Scanner sc2 = new Scanner(System.in);
	System.out.print("나이를 입력하세요");
	age2 = Integer.parseInt(sc2.nextLine());
	
	if(age2 <5) {
		System.out.println("입장료는 2500 입니다.");
	}else if(age2 <=11) {
		System.out.println("입장료는5000 입니다.");
	}else {
		System.out.println("입장료는 무료 입니다.");
	}
		
		
	
	}

}
