//static method 함수: 
//static 함수를 쓰면 편한가?
//왜 편한가?
//내가 static 함수를 쓴다면 왜 쓸것인가? 
//Math.Random()  이게  static method함수 이다.  HINT  
//System.out 또한 static 이다.  편해서..
//답이 무엇인가...자주쓰는거..많이 사용하니까..설계자 입장에서 많이하는 거니까. 그게 편리하다.
//설계도를 그릴때 사람들이 많이 쓸것 같은 함수면 편하게 static 으로 간다.
//자주 사용하니까 편하게 쓰게 해주려고 new 하지 않아도 쓸수있게 해준다.

//다만 static을 낭비하면 문제가 생긴다. 공유자원이라서 똑같은 놈이 동시에 접근할 수 있음. 누군가 들어가서 화장지를 다써버리면
//누군가가 들어가서 값을 바꿔버릴 수도잇다.
// 프로그램은 양면성을 지닌다. 좋은 기능일수록 잘못쓰면 독이 된다.  ex)트리거 =이쪽데이터가 바뀌면 자동으로 바뀜 , 단점은 줄이 길어진다. 취소가 되기도함.
//                                                     쓰레드 잘못쓰면 모든 프로그램이 종료되어버림
// static 을 남발하면 안된다. 



class StaticClass{
	int iv;
	
	static int cv;

    void m() {//일반함수  이 함수가 있기  이전에 static int cv; 는 메모리에 이미 올라가 있기 때문에 2번이 가능하다.
    	//1. iv 값을 가지고 놀수 있다(0)
    	iv = 100;
    	//2.cv 값을 가지고 놀 수 있다(0) >>생성시점에대한 고민을 해봐야함당.
    	//!!!!!!!!!!!static 자원은 항상 일반 자원보다 memory 에 먼저 생성된다. 이거 되게 중요한 명제임!!!!!!!!!!!!!!!!!!!!
    	//StaticClass.cv = 100; //이게 원칙적인방법.
    	cv =200; //해도 문제가없다. 같은 식구라서.
	
    }
	
	
	static void sm() { //static 함수
		//1.static 함수가 일반변수인 iv 값을 가지고 놀수 있다.(x) //memory 생성시점때문에
		//static 함수안에서는 일반변수를 new 할 수 없다. (메인 함수 안에서 호출해줘야함)
		//iv = 200; Cannot make a static reference to the non-static field iv .static 으로 바꿔야 쓸수있다.
		//2.static 변수인 cv 값을 가지고 놀 수 있다.
		cv= 500; 
		//error 없을려면 끼리끼리 놀아라. 스테틱은 스테틱끼리 놀아라..
					
		}
	}
	



public class Ex09_Static_Method {

	public static void main(String[] args) {
		//원칙적인 방법
		//StaticClass sc = new StaticClass();   뉴를 하지 않아도 스테틱 함수는 메모리에 올라가있으므로 불러서 쓸수있따.
		StaticClass.sm(); 
		System.out.println(StaticClass.cv);
		
		//일반자원 사용...
		StaticClass sc = new StaticClass();
		sc.m();
		System.out.println(sc.iv);
		System.out.println(sc.cv);
		System.out.println(StaticClass.cv);
		

	}

}
