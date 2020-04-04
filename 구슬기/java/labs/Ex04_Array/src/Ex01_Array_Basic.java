import java.util.Arrays;

/*
 배열도 객체다.
 1. 배열은 객체다(new통해서 생성)
 2. new 를 통해서 만들어지는 모든자원은 heap 에 만들어진다.
 3. 고정배열(정적배열) : 배열의 크기는 한번 정해지면 고정된다.
 4. 배열은 필수로 해야하는 자료구조의 기본이다.  // 입사시험때 자료구조가 기본이다.  
    
 */
public class Ex01_Array_Basic {
	public static void main(String[] args) {
		 int s, s1, s2, s3;
		int[] score= new int[3]; //이게 배열을 만든거 방을 세개 만든거.  방번호(첨자, index)
		System.out.println(score[0]);
		score[0] = 101; //각각의 방에 (index)를 사용해서 값을 넣어준다.
		score[1] = 20;
		score[2] = 300;
		System.out.println(score[0]);
		
		//방의 개수는 항상 index값보다 1크다. ((방의개수)n-1 == 마지막 index 값이다)
		
		//score[3] = 40; //없는 3번방.. 마지막방의 index >> 2
		// java.lang.ArrayIndexOutOfBoundsException  
		//예외가 발생했어(문제가생겼어)
		//그래서 컴파일러가 강제로 프로그램을 종료..\
		//문제가 발생했음에도 불구하고 일단 실행시키기 위한것 (try ~catch구문)
		//문제를 해결하는 것이 아니고 프로그램이 강제 종료되는 것을 막는다.
		System.out.println("END");  // 21번줄에서 오류가 났기때문에 27번줄은 실행이 안됨.
		
		//Array 배열 (궁합이 제일 잘 맞는 제어문은 : for문)
		for(int i=0;i<3;i++) {
			System.out.printf("[%d]=%d\t",i,score[i]);
		}
		System.out.println();
		for(int i = 0;i<score.length; i++) {//length는 배열의 길이! 몇개들어있냐!
			System.out.printf("[%d]=%d\t",i,score[i]);
		}
		System.out.println();
		
		//Tip Array 도와주는 클래스
		String result = Arrays.toString(score); //간단하게 배열안에 값들을 나열해준다. 하지만 지금은 쓰지마세용. for 문이 익숙해지면 쓰세용. 회사면접에서 toString 쓰면 빵점!
		System.out.println(result);
		
		Arrays.sort(score);  //자동정렬 시켜준다.  얘도 아직은 쓰지마세용. for문 돌리면서 값비교해서 위치바꾸는 작업을 해야한다. 시험문제로는 빵점! 개발할때 쓰세요.
		System.out.println();
		result = Arrays.toString(score); 
		System.out.println(result);
		
		//입사시험 가보면  배열정렬문제가 가장 흔하다. 
		
		//12,8,4,50  얘네를 순서대로 정리하려면 배치할때 원래 값이 잠깐 나와있어줄 공간이 필요하다.(자료구조임==데이터들을 얼마나빨리 적은수로 대처?대체할거냐 하는 문제이다.적은횟수로 빨리..)
		
		//Today Point
		//배열3가지   외울것!
		//내일 가장 늦는 사람이 칠판에..
		int[] arr = new int[5]; //기본 (방의개수)
		int[] arr2 = new int[] {100,200,300}; //초기값을 통해서 방이 만들어 지고 초기화
		int[] arr3 = {11,22,33,44,55}; //컴파일러가 알아서 new를 자동생성 한다. 이방법이 제일 많이 사용된다.
		//javascript : (var)let cararr = [1,2,3,4,5]; 자바랑 자바스크립트방법이다르다.
		
		for(int i =0; i<arr3.length;i++) {
			System.out.println(arr3[i]);
		}
		
		//배열은 객체다(new ...memory >> heap)
		int[] arr4; //배열은 객체기때문에 선언과 할당을 분리할수있따.
		arr4 = new int[] {21,22,23,24,25};
		System.out.println("arr4 : " + arr4);
		//배열의 할당은 (주소값할당)
		int[] arr5= arr4;
		//증명
		System.out.println(arr5 == arr4);
		
		//Car c = new Car();
		//Car c2 = c;
		
		String[] strarr = new String[] {"가","나","다라마"};
		char[] ch = new char[10]; //qlsanswk '\u0000'
		for(int i = 0;i< ch.length;i++) {
			System.out.println(">"+ch[i]+"<"); //빈문자라 > < 이렇게나옴
		}
		
		//8가지 기본타입 +String >> Array 타입가능
		//**** 클래스타입(사용자 정의 타입) >> Array타입 가능
		//Car c = new Car();
		//Car c2 = new Car();
		//Car c3 = new Car();
		
		//Car[] cars = new car[10];    이렇게 하는게 훨씬 편하긴하당.
		
				
		}
	}


