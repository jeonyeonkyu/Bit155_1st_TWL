package Ex08_CollectionFrameWork;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;

//Collection FrameWork
//나열된 자원에 대해 순차적으로 접근해서 값을 리턴하는 표준 정의
//Iterator 인터페이스
//1. hasNext() , Next() ... 이런 이름으로 구현해라 (강제)
//2. Collection { public Iterator iterator(); }  >> List 상속 >> ArrayList 구현
// >> hasNext(), Next() , remove() , iterator() >> 재정의 구현 ....
//3. ListIterator  : 양방향 ... 데이터 read 표준화 제공 ...
public class Ex08_Collection_Iterator {
    public static void main(String[] args) {
        ArrayList list = new ArrayList();
        list.add(100);
        list.add(200);
        list.add(300);
        for(int i = 0 ; i < list.size() ; i++) {
            System.out.println(list.get(i));
        }

        //Collection 이야기하는 표준화된 출력방식
        Iterator it = list.iterator();
        while(it.hasNext()) {
            System.out.println(it.next());
        }

        //ArrayList<int> intlist = new ArrayList<int>();
        ArrayList<Integer> intlist = new ArrayList<Integer>();
        intlist.add(44);
        intlist.add(55);
        intlist.add(66);

        Iterator<Integer> list2= intlist.iterator();
        while(list2.hasNext()) {
            System.out.println(list2.next());
        }

        for(int i = 0 ; i < intlist.size(); i++) {
            System.out.println(intlist.get(i));
        }
        //일반 for문 역방향
        for(int i = intlist.size() - 1; i >= 0 ; i--) {
            System.out.println(intlist.get(i));
        }

        //Iterator 역방향 조회 불가

        //역방향 조회 .... (조건 : 순방향 --> 다시 --> 역방향)
        System.out.println("********");
        ListIterator<Integer> li2 = intlist.listIterator();
        //순방향
        while(li2.hasNext()) {
            System.out.println(li2.next());
        }
        //역방향
        System.out.println("********");
        while(li2.hasPrevious()) {
            System.out.println(li2.previous());
        }
    }
}
