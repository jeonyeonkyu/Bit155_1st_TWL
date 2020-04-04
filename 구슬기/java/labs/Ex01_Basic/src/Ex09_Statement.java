import java.util.Scanner;

public class Ex09_Statement {

	public static void main(String[] args) {
		System.out.println("입력");
		/*Scanner sc = new Scanner(System.in);
		
		if(sc.hasNextInt()) { //의문 (true, false)
			System.out.println("정수 입력");			
		}else {
			System.out.println("정수가 아니네 다시 입력");
		}

		 //암기하자 (월 암기 테스트) 제어문	
		 //조건문 : if 종류 (3가지) , switch(){case : break;} 
		 //반복문 : for(반복횟수 명확), while(true, false), do~while(){}
		 //분기문 : break(블럭탈출), continue(아래 구문 skip)
		int count=0;  //하나일땐 중괄호 생략가능이지만 지금은 다쓰도록하자
		//if(count > 1) System.out.println("true");
		if(count >1) {
			System.out.println("true");
		}
		//2번째
		if(count > 1 ) {			
		}else {
			
		}
		//3번째
		if(count >=90) {
		}else if() {
			
		}else {
			
		}
		
	*/
		
		char data='A';
		switch(data) {
		case 'A' : System.out.println("문자비교");
		     break; //switch 탈출
		default : System.out.println("나머지 모든 것");     	     
		}
		
		
		//반복문
		//1~100까지의 합을 sum 이라는 변수에 담아서 출력하세요
		
		int sum =0;
		
		for(int i = 1 ; i <= 100 ; i++) {
			sum+= i;
		}
		System.out.println("1~100 : "+ sum);
		
		//for문을 사용해서 1~10까지의 홀수의 합을 구하세요
		//단 for문 만 사용 (if, swich 사용금지)
		
		int sum2 = 0 ;
		for(int j = 1 ; j <=10 ; j += 2) { 
			sum2 += j ;
			
		}
		System.out.println(sum2);
		
		//1~100까지의 합
		//짝수의 합을 구하세요 (if 문)
		
		int sum3 = 0; //main이 가지고있는 지역변수
		for(int i = 1 ; i <=100 ; i += 2) { 
			if(i %2 != 0) {
				sum3 += i ;
			}
			
		}
		
		System.out.println(sum3);
		
		
		//입사시험 (필수)
		//구구단 출력하기( 중첩 for문)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//2단 -9단 
		//1~9 까지 * 연산 수행
		
		for(int i = 2 ; i <=9 ; i++) {
			for(int j = 1 ; j <=9 ; j++) {
				//System.out.println("i : "+ i + "*" + j + "=" + i*j);
				System.out.printf("[%d]*[%d]=[%d]\t", i,j,i*j);
			}
			System.out.println();//이렇게 해야 정렬되어 나온다.
		}
					
		//중첩 for문 응용하기 (별찍기)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		System.out.println();
		//Today Point : break(탈출) , continue(스킵 skip > 아래구문을 )
		for(int i = 2 ; i <=9 ; i++) {
			for(int j = 1 ; j <=9 ; j++) {
				if(i ==j) {
					break; //안쪽 for 문 탈출
				}
				//System.out.printf("[%d]*[%d]=[%d]\t", i,j,i*j); 이러면 숫자가나오고
				System.out.printf("%s","*");  //이러면 별모양이 나옴
			}
			System.out.println();
		}
		
		
		for(int i = 2 ; i <=9 ; i++) {
			for(int j = 1 ; j <=9 ; j++) {
				if(i ==j) { //if(i ==j) continue; {중괄호 블럭 생략가능}
					continue; //아래 있는 구문을 skip 하세요  	[[[[System.out.printf("%s","*");  //이러면 별모양이 나옴 ]]]을 스킵함
				}
				System.out.printf("[%d]*[%d]=[%d]\t", i,j,i*j);//이러면 숫자가나오고
				//System.out.printf("%s","*");  //이러면 별모양이 나옴
			}
			System.out.println();
		}
		
		for(int i = 2 ; i <= 9 ; i++) {
			for(int j =1 ; j < i ; j++) {// j<=9 //모양을 메모장이나 연습장에 그려보자
				System.out.print("*");
			}
			System.out.println();
		}
		
		for(int i = 100 ; i >=0 ; i --) { //연습
			System.out.println(i);  
		}
		//설계도 안에 논리의 흐름이 들어가야하기때문에 논리적 사고 필요함 
		
		//피보나치수열   정처기 단골 문제 ,최대공약수, 최대공배수, 하노이의 탑
		int a = 0, b =1 ,c = 0;
		for(int i = 0 ; i < 10 ; i++) {
			a =b;
			b =c;
			c = a + b;
			System.out.println(""+c);
		}
		
		
		
		
	}

}
