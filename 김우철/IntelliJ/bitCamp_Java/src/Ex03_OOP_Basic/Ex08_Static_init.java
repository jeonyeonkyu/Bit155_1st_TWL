package Ex03_OOP_Basic;

//static 변수는 객체마다 같은 값을 가지게 할거야
//instance 변수는 객체마다 다른 값을 가지게 할거야
class InitTest {
    static int cv = 10;
    static int cv2;
    int iv = 1;

    static {  //static 초기자 : static 변수 초기화 (실행시점)
        //논리적인 코드 ...
        cv = 20;
        cv2 = cv + 10;
    }

    //초기자 (static memberfield 나  memberfield 의 값을 초기화)
    { //초기자 >> 메모리에 iv 라는 변수가 올라가고 나서 바로 실행 ...
        //instance 변수의  초기화
        //if(iv > 10) iv = 100;
        iv = 3;
    }
}

public class Ex08_Static_init {
    public static void main(String[] args) {
        System.out.println(InitTest.cv);
        System.out.println(InitTest.cv2);
        InitTest init = new InitTest();
        System.out.println(init.iv);
    }
}
	/*
		 * 객체간 공유하는 자원 =
		 1. class variable(클래스 변수), static variable(공유(객체간) 변수)
		 2. 목적 :  정보를 담는것 (★생성되는 모든 객체가 공유하는 자원) : 객체 공유자원
		     heap 영역에 생성된 객체들의 공통자원(공유자원)
		     ((
		     메소드(스태틱) 에어리어에 선언한 static 변수가 생성됨
		     이 에어리어에 생성된 static변수를 Heap 영역에 생성된 객체들이 마음껏 사용할 수 있음
		     ))
		 3. 특징 : 접근방법 >> 클래스이름.static변수명 (객체가 만들어 지지 않는 상황에서도 접근가능)
	     ★4.생성시점 : javac로 .java -> .class(실행 파일)을 만든 후
		     JVM이 동작할 시점은 java (클래스파일명)을 입력할 때 동작함
		     힙이나 스택을생성하기전에 일어나는 일임.
		     클래스 로더에 의해 클래스 정보(=메타데이터 : 설명)를 제일 먼저 class area에 올림
		     >> 이 클래스는 언제 만들었고 어떤 자원을 import 하고 있고 변수 몇개를 만들었고 등을 기술 하다가
		     >> 클래스 안에 static 변수 or static 메소드가 있으면
		     >> 이녀석들을 class area에 올린다


		     ★static은 new를 안해도 클래스 영역에 올라감
		     ex)main 함수
		     ->main이라는 static 메소드 이름을 가지면 클래스 영역에서 스택으로 끌어내림
		     -> new로 만들지 않아도 바로 실행할 수 있음
		 */
//메타데이터 : 언어를 해석하는 언어