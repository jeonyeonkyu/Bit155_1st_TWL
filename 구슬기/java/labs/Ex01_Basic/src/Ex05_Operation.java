
public class Ex05_Operation {

	public static void main(String[] args) {
		int result = 100/100;
		System.out.println(result);//2
		
		result = 13/2;  //6  몫만 나옴 , 나머지안나옴
		System.out.println(result);
		
		//나머지를 구하는 연산자(%)
		result = 20%6;
		System.out.println(result);//2
		
		//증가 , 감소 ( 증가감 연산자 : ++ , --) 1씩증가, 1씩 감소
		int i = 10;
		//i = i + 1;
		++i; //전치 증가
		System.out.println("전치 i : "+ i);
		i++; //후치증가
		System.out.println("전치 i : "+ i);
		
	    // 변수 혼자 있을때에는 전치 나 후치는 의미 없다
		
		//Point (연산자 전치, 후치 성질)
		int i2 = 5;
		int j2 = 4;
		
		int result2 = i2 + ++j2;
		System.out.println("result2 : " + result2 +" j2 : " + j2);
		//result2 : 10 j2 : 5   i2 : 5
		
		
		result2 = i2 + j2++;
		System.out.println("result2 : " + result2 + " j2 : " + j2);
		//result2 : 10 j2 : 6   i2 : 5
		
		//Today Point
		//자바의 연산 규칙
		//*****[정수]의 모든 연산은 [int]로 변환 후 처리 됩니다.******
		//byte + byte => 컴파일러가 int + int 변환해서 계산한다 => 
		byte b = 100; //= -128 ~ +127  //리터럴값이 정수일때 타입안에 들어가면 보통 따로 형변환하지 않음 개발자들이 그래서 신경 안씀
		byte c = 1;
		//byte d = b + c;
		//byte d = (byte)(b + c); //손실 만약 답이 128이 나오면 overflow라서 -128 이 나오게됨
		int d = b + c; //이렇게하면 손실이 발생하지 않음
		System.out.println("d :" + d);
		
		//byte + short => 컴파일러가 int + int 로 해석한다
		//char + char  => 컴파일러가 int + int 로 해석한다
		//연산처리시
		//point : 정수연산에  int 보다 작은 타입은  int 로 변환된다. (long 은 제외 -int 보다 크니까 )
		//(byte, char, short 연산 -> int)
		
		//byte + short => int + int
		//char + int => int  + int
		//int + lont => lont + long 이 된다.   큰값으로 변환됨.

		//정수+ 실수 >타입크기와 상관없이 실수가 이긴다.
		long ll = 10000000000L;
		float ff = 1.2f;
		float fresult = ll + ff;
		System.out.println(fresult);
		
		float num2 = 10.45f;
		int num3 = 20;
		//num2 + num3
		//float + int >> float + float
		
		//float result5 = num2 + num3; //내생각: 명시적 변환을 해줘야해서 주석처리
		//System.out.println(result5);
		
		int result5 = (int)(num2 + num3);
		System.out.println("정수값만 출력 :" + result5);
		
		char c2 = '!'; //char 는 정수타입이다. 문자이긴해도    
		char c3 = '!';
		
		//char result6 = c2 + c3;    오류나는 이유는 int로 계산되기때문에
		int result6 = c2 + c3; //int + int
		System.out.println("result6 : " + result6);
		System.out.println((char)result6); //66이라는 십진수 값이 아스키 코드표문자로 보면 > B 가나옴
		
		
		
		
		
		
		//제어문
		//중소기업의 시험문제 (구구단 출력) >> 응용하면 별찍기(삼각형)
		
		int sum = 0; //(지역변수임 그래서 초기화함)
		//int j= 100; 같은 j 변수 선언 불가함
		for(int j = 1 ; j <= 100 ; j++) {
			//System.out.println("j : " + j);
			if(j%2 == 0) {
				//System.out.println(j);
				//sum = sum + j;
				sum+=j; //대입연산자
		}
}
		//System.out.println(j);  for문이 실행될때 생성되고 for문이 끝나면 사라짐 
		System.out.println(sum);	
			
		
		//== 연산자 (값을 비교하는연산자)
		if(10 == 10.0f) {
			System.out.println("True");
		}else {
			System.out.println("False");
		}
	
		// ! 부정 연산자
		if('A' != 65) { //같지않니?
			System.out.println("어 같지않아");
		}else {
			System.out.println("어 같은 값이야"); //
		}
	
		//암기하자 (Today Point)!!!!
		//삼항 연산자
		int p = 10;
		int k = -10;
		int result8 = (p == k) ?  p : k;   //p하고 k하고 같니? 물음표 앞 조건식이 트루라면 콜론앞걸 취하고 거짓이면 콜론뒤를 취한다
		System.out.println("result8 :" + result8);
		
		//삼항 연산자는 제어문 if와 성능에서 큰 차이는 없지만 근데 삼항이 짧아서 많이 활용됨
		if(p == k) {
			result8 = p;
		}else {
			result8 = k;
		}
		System.out.println("result8 :" + result8);
		
		//진리표
		/*
		 논리연산
		 0 : False
		 1 : True
		 0과 1로 조합할수 있는 가짓수 4가지
		         OR       AND
		 
		 0 0     0         0
		 0 1     1         0
		 1 0     1         0
		 1 1     1         1
		 
		 Oracle (sql)
		 
		 select *
		 from emp
		 where empno=1000 and sal > 2000; //그리고 (둘다 참인 조건)을 모든거(emp)에서 모든것을(*) 가져와라
		 
		 select *
		 from emp
		 where empno=1000 or sal > 2000;  //또는, 이거나(둘중에 하나만 참이어도 만족)
		 
		 연산자
		 |  or   연산자
		 &  and  연산자
		 
		 0 과 1 로 변환해서 bit 연산
		 
		 || 논리연산 (OR)
		 && 논리연산 (AND)
		
		 */
		
		int x = 3;
		int y = 5;
		System.out.println("x|y :" + (x|y));  //7
		
		//컴퓨터는 십진수 3,5 를 이진수로 변환해서 bit 연산한다. 
		//십진수 -> 2진수 (0,1)
		//128 64 32 16 8 4 2 1 
		//  0  0  0  0 0 0 1 1  >> '십진수' 3은 '2진수' 00000011
		//  0  0  0  0 0 1 0 1  >> '십진수' 5는 '2진수' 00000101
		//OR0  0  0  0 0 1 1 1  >>  4 + 2 + 1 > 7
		//AND0 0  0  0 0 0 0 1  >>  1
		
		System.out.println("x&y :" + (x&y));  //1
		
	    //Today Point (&&(AND), ||(OR))
		//if(10 > 0 && -1 > 1 && 100 > 2 && 1 > -1...10개) {실행문} // && 일때는 두개다 참일때만
		//if(10 > 0 || -1 > 1 || 100 > 2 || 1 > -1...10개) {실행문} // || 일때는 두개중 하나여도
			
	}

}
