import java.util.Vector;

/*
 * Collection FrameWork
 * [다수의 데이터를]다루는 표준화된 인터페이스를 구현하고 있는 클래스 집합을 의미한다.
 
 
                (uml그림 삼각형 대충표현)
 Collection 인터페이스 <-  List(상속)  <---- ArrayList ....(구현)     얘랑  
                   <-  Set(상속)   <---- HashSet, TreeSet(구현)
 Map 인터페이스(Key, value) <---- HashMap  ...(구현)   얘는   정말 중요하다 외워라..
 -----------------------------------------------------------------------
 
 List Interface (줄을 서시오) 줄을 서니까 순서가있어 순서가 있으니까 중복데이터 들어올수있어!
 :순서(번호표), 중복(허용) >> 내부적으로 데이터(자료, 객체)들을  >> 배열관리[홍길동][홍길동][][]
 

 1. Vector (구버전)    ->동기화(멀티쓰레드)환경에서 동기화 보장한다.  -> Lock(보호) -> 성능 조금떨어진당..-> 한강 화장실 
                                                   (내가 화장실왔는데 누가 들어올까바 문 잠그는 것처럼) 하나 들어오면 막지만, 화장실앞에 줄을 서게되니까 성능은 포기하면좋다. 
 2. ArrayList (신버전) ->동기화(멀티쓰레드) -> Lock (x):필요에 따라서 잠근다 -> 성능을 고려해서!! ->  ex한강 비빔밥축제.. 처럼 여러사람이 달라붙어도 문제없는 자원에 쓰인다. 
 
 함수 열개를 돌리려면 스택이 열개가 있어야함. 스택은 동시처리를 못하니까.  스택이 여러개 있는것 그걸 멀티 쓰레드라고 한다. 
 
 ---------------------------------------------------------------------------
 
 Array (배열) : 고정배열
 방의 개수가 한번 정해지면 (방의 크기는 변경 불가)
 int[] arr = new int[5];
 arr[0] = 100;.....
 10개의 방이 필요하다면..... 줄이거나 늘릴수 없다....
 int[] arr = {10,20,30}; 한번정의되면 방을 늘리거나 줄일수없다!!! 
 
 Array
 1. 배열의 크기가 고정 : Car[] card = {new Car(), new Car()}; 방2개
 2. 접근 방법 (index (첨자)) ....index 의 시작은 0 .....  마지막은 length-1 >> cars[0]
 3. 초기 설정 변경 불가
 
 List 인터페이스를 구현한 클래스  :: Vector, ArrayList
 1. 배열의 크기를 동적으로 확장.... 축소도 가능 >> 사실은 배열의 재할당
 2. 순서를 유지(Array) , 순서값(index) , 중복값을 허용한다. 
 3. 데이터의 저장공간으로 (Array)를 사용한다..?
 
 정적배열의 length는 100L안에 3L차있으면 전체 크기 100L를 봄  
 동적배열은 100L안에 3L차있어도 3L 라고 나옴   -물건이 담겨진 만큼.
  
 */

public class Ex01_Vector {
	public static void main(String[] args) {
		Vector v = new Vector();  //내부자원필요없다. 순서를 가지고 있고 중복을 허용한다.
		System.out.println("초기 default 용량 :" + v.capacity()); //10개 방 기본이구나!
		v.add("AA");
		v.add("BB");
		v.add("AA");
		v.add(100); //Object 는 모든 타입의 부모라서 모든 타입을 받는다. 
		System.out.println(v.toString());
		
		//Array >> length >> 배열의 길이
		//List >> size >> 값의 길이
		
		for(int i = 0; i< v.size();i++) {
			//정적(Array : arr[i] ...이렇게 찍어야 값을 볼수있다.
			System.out.println(v.get(i)); //이렇게 함수로 볼수있다. get() 함수로 값을 가지고 온다. 괄호안에 인덱스.
		}
		
		//개선된for 문
		
		for(Object obj : v) {  //배열이 가지고 있는 타입을 써줘야 한다.  
			System.out.println(obj); //println object파라메터를 받는다. 
		}
		
		//작은그릇으로 해결되는걸 겁나 큰그릇인 Object에 넣어서 받았다...비효율적이다 .. 
		//그릇을 바꿀수있는 거.
		//제너릭 *****>> 타입을 강제
		Vector<String> v2 = new Vector<String>(); //default로 그릇을 만들면 String 만 담을 수 있는 그릇이다. 
		// v2.add  하면(String e)로 바뀌어져 있다. 
		v2.add("Hello");
		v2.add("world");
		v2.add("King");
		for(String str : v2) {    //String 이라고 명확히 해놨기때문에 String 으로 받을 수 있다.
			System.out.println(str);    
		}
		
		System.out.println(v2.toString());
		System.out.println(v2.get(2));
		System.out.println("size 데이터 개수: "+ v2.size());
		System.out.println("Capacity : "+ v2.capacity());
		
		Vector v3 = new Vector();
		System.out.println(v3.capacity()); //10
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		System.out.println(v3.capacity());  //2배정도 증가시킨다 그랫 20
		System.out.println(v3.size());      //값의 개수에 맞춰서 새 배열을 만든다 12

	}

}
