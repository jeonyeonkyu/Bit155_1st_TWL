//static 변수는 객체마다 같은 값을 가지게 할거야
//instance 변수는 개체마다 다른 값을 가지게 할거야

//논리적으로 이해가 되지 않을때는 그냥 외우는것도 방법이다.


class InitTest{
	static int cv = 10;	//스테틱은 클래스 이름으로 접근 가능 
	static int cv2 = 2; 
	int iv = 1;          // 인스턴스는 뉴!
	
	static { //[static초기자] : static 변수 초기화(실행시점) 클래스 로더가 읽으면서 실행된다.
		     //왜 얘를 쓰나? 이 질문에 대한 답은 다음에 나온다.
		     //지금 나옴.. 논리가 들어가는 코드가 된다. ex> cv2 = cv + 20; 이런거
		cv = 20;
		cv2 = cv + 20;
	}
	
	
	
	//초기자 (static memberfield 나 memberfield 의 값을 초기화)
	{ //이 중괄호 해놓는것을[ 초기자 ]라고 함>> 메모리에 iv 라는 변수가 올라가고 나서 바로 실행된다.
      //instance 변수의 초기화
		iv = 3;   //초기 설정해놓은 값1 위에 3이 덮어씌인다.
	}
	
}




public class Ex08_Static_init {

	public static void main(String[] args) {
		System.out.println(InitTest.cv);
		InitTest init = new InitTest();
		System.out.println(init.iv);
		

	}

}
