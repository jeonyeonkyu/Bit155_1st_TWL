import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;

//Collection FrameWork
//나열된 자원에 대해 순차적으로 접근해서 값을 리턴하는 표준을 정의해놓음. 자바만든사람이..
//Iterator 인터페이스임
//1.hasNext() ,Next(), ..이런 이름으로구현해라(강제)
//2.Collection{ public Iterator iterator();}  이걸 List 가 상속받고  ArrayList 가 구현한다.
//>>hasNext(), Next(), remove() >> 재정의 를 통해서 구현했다는 얘기..   컬렉션인터페이스가 이터레이터 인터페이스를 리턴하는 메소드를 갖고있고 어레이 리스트가 hasNext(), Next를 구현했다.
//3.ListIterator : 양방향 가능... 데이터를 read 할수있는 표준화 제공...

public class Ex08_Collection_Iterator {
	public static void main(String[] args) {
		
		ArrayList list = new ArrayList();
		list.add(100);
		list.add(200);
		list.add(300);
		
		//기존방식
		for(int i =0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		
		//이게 컬렉션에서 이야기하는 표준화된 출력방식이다.
		Iterator it = list.iterator();  //for 기능..
		while(it.hasNext()) { // hasNext = it에 값이 있니?
			System.out.println(it.next()); //next = 1개씩 빼내줘.
		}
		
		
		//ArrayList<int> intlist = new ArrayList<int>();  //int 는 참조타입이 아니라서 오류난다. Integer가 와야함
		
		ArrayList<Integer> intlist = new ArrayList<Integer>(); //Generic 주소타입만 받는다. 
		intlist.add(44);
		intlist.add(55);
		intlist.add(66);
		
		Iterator<Integer> list2 = intlist.iterator(); //제너릭으로 강제한 타입으로 이터레이터도 받아줘야한다. 
		while(list2.hasNext()) {
			System.out.println(list2.next());  //44 55 66
		}
		
		for(int i = 0; i< intlist.size();i++) {
			System.out.println(intlist.get(i)); //44 55 66
		}
		System.out.println("----------------------------------------------");
		
		//일반 for문으로 역방향 출력 가능한가요?
		for(int i = intlist.size() -1; i>=0 ;i--) {
			System.out.println(intlist.get(i)); //66 55 44
		}
		//Iterater 얘는 역방향 조회 불가
		
		
		//역방향 조회....만들어준다 대신 조건은. (조건: 순방향시작 후  다시역방향으로 )
		
		//순방향 한번한담에 hasPrevious() 해줘야 함.
		ListIterator<Integer> li2 = intlist.listIterator();
		while(li2.hasNext()) {
			System.out.println(li2.next());
		}
		//역방향
		System.out.println("*********");
		while(li2.hasPrevious()) {
			System.out.println(li2.previous());
		}
		
		
	}

}
