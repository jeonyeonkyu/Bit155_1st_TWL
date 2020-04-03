package Ex08_CollectionFrameWork;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

//Set 인터페이스를 구현하는 클래스
//Set 원 안에 들어가세요
//데이터 순서 보장(x) , 중복(x) : 순서가 없고 중복을 허락하지 않는 데이터 집합 ... Set
//구현하는 클래스 : HashSet , TreeSet
public class Ex09_Set_Interface {
    public static void main(String[] args) {
        HashSet<Integer> hs = new HashSet<Integer>();
        hs.add(1);
        hs.add(100);
        boolean bo2 = hs.add(55);
        System.out.println(bo2);
        System.out.println(hs.toString());
        bo2 = hs.add(1); //같은 데이터   추가 안되요  (보장)
        System.out.println(bo2);
        System.out.println(hs.toString());
        hs.add(2);
        System.out.println(hs.toString()); //출력 .. 순서 보장되지 않아요

        HashSet<String> hs2 = new HashSet<String>();
        hs2.add("b");
        hs2.add("A");
        hs2.add("F");
        hs2.add("c");
        hs2.add("z");
        hs2.add("A");
        hs2.add("A");
        hs2.add("A");
        System.out.println(hs2.toString());
        //5조.. 로또 .. 중복 .....
        String[] obj = {"A", "B", "C", "D", "B", "A"};
        HashSet<String> hs3 = new HashSet<String>();
        for (int i = 0; i < obj.length; i++) {
            hs3.add(obj[i]);
        }
        System.out.println(hs3.toString());
        //Quiz
        //HashSet 을 사용해서 1~45까지 난수 6개를 넣으세요
        HashSet lotto = new HashSet();
        //6개의 값 .... HashSet 중복값은 넣을 수 없다
        //size() 활용 ...
        System.out.println(lotto.size());
        for (int i = 0; lotto.size() < 6; i++) { //lotto.size() < 6
            int num = (int) (Math.random() * 45) + 1;
            lotto.add(num);
            System.out.println("i" + i);
            //i 값은 의미가 없어요 ^^
            //추출한 횟수라면 의미가 있을지도 ... 몇 번만에 나왔어요 ^^
        }
		/*
		for(int i = 0 ; i < 6 ; i++) {
			numbers[i] = r.nextInt(45)+1;
			 for(int j = 0 ; j < i ; j++) { //j < i (채워진 개수 만큼 비교)
				 if(numbers[i] == numbers[j]) {
					 i--; //point 같은 방의 값을 바꾸어여 한다
					 break;
				 }
			 }
		}
		*/
        System.out.println(lotto.toString());

        //while 전환
        Set set2 = new HashSet();
        int index = 0;
        while (set2.size() < 6) { //조건 true
            System.out.println("index : " + (++index));
            int num = (int) (Math.random() * 45) + 1;
            set2.add(num);
        }
        System.out.println("set2 : " + set2.toString());

        HashSet<String> set3 = new HashSet<String>();
        set3.add("AA");
        set3.add("DD");
        set3.add("ABC");
        set3.add("FFFF");
        System.out.println(set3.toString());

        Iterator<String> s = set3.iterator();
        while (s.hasNext()) {
            System.out.println(s.next());  //index 순서를 보장하지 않아요
        }

        //Collections.sort(List<T> );
        //sort 함수의 parameter 로 List 인터페이스를 구현한 객체 ...
        //vector , stack , ArrayList >> 저장공간 배열 >> 정렬 가능

        List list = new ArrayList(set3); //Collection 부모각 자식객체인 HashSet 주소
        System.out.println("before  무작위:" + list.toString());
        Collections.sort(list);
        System.out.println("after   정렬:" + list.toString());
        Collections.reverse(list);
        System.out.println("reverse   정렬:" + list.toString());


    }

}
