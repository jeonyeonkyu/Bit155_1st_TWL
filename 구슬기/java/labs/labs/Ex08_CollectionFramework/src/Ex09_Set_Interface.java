import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

//Set 인터페이스를 구현하는 클래스
//Set 원 안에 들어가세요
//데이터 순서 보장(x) , 중복(x) : 순서가 없고 중복을 허락하지 않는 데이터 집합....Set 
//구현하는 클래스 : HashSet , TreeSet

public class Ex09_Set_Interface {
	public static void main(String[] args) {
		
		HashSet<Integer> hs = new HashSet<Integer>();
		hs.add(1);
		hs.add(100);
		boolean bo2 = hs.add(55); //원안에 순서 없이 때려넣는중..
		System.out.println(bo2); //true 정상적으로 원안에 들어가면 true 값 주나봄
		System.out.println(hs.toString()); //[1, 100, 55]
		
		bo2 = hs.add(1); //같은 데이터는 추가가 안됩니다.(보장되는 Set)
		System.out.println(bo2); //false  원안에 못들어 갔다..  중복이니까. 
		System.out.println(hs.toString()); //[1, 100, 55]
		hs.add(2);
		System.out.println(hs.toString()); //[1, 2, 100, 55] 2는 중복이 아니라 들어갔고, 출력될때마다 값의 순서가 다르다.
		
		
		System.out.println("----------------------------------------------------");
		
		
		HashSet<String> hs2 = new HashSet<String>();
		hs2.add("b");
		hs2.add("A");
		hs2.add("F");
		hs2.add("c");
		hs2.add("z");
		hs2.add("A");
		hs2.add("A");
		hs2.add("A");
		System.out.println(hs2.toString());  //[A, b, c, F, z]  겹치는 값인 A 는 안나온다.
		//5조  로또...중복값 받지않으니까.. 
		
		System.out.println("----------------------------------------------------");
		String[] obj = {"A","B","C","D","B","A"};
		HashSet<String> hs3 = new HashSet<String>();
		for(int i = 0; i< obj.length ;i ++) {
			hs3.add(obj[i]);
		}
		System.out.println(hs3.toString());  //[A, B, C, D]  겹치는 거 빼고 나옴.
		
		
		System.out.println("----------------------------Quiz---------------------");
		//Quiz
		//HashSet 을 사용해서 1~45 까지의 난수 6개를 넣으세요
		HashSet<Integer> lotto = new HashSet<Integer>();
		for(int i = 0; lotto.size()<6 ;i++) {  //size 는 0부터 값이 찰때마다 1씩 늘지만 중복값은 늘지 않기때문에  ...i값은 의미가 없다. i는 100이든 1000이든  lotto.size() 6이 될때까지 돌기때문에!!! 
			int num = (int)(Math.random()*45)+1; // 0.0 <= random < 1.0 -> 0.0 <= random < 45.0 -> +1 
			lotto.add(num);
		}
		System.out.println(lotto.toString()); //중복값이 나올수가 없다... 중복값이 있으면 막아버리고.. 계속 돌면서 같은값이 아닐때만 하나씩 채운다. 
		
		System.out.println("----------------------------------------------------");
		//while 전환
		Set set2 = new HashSet(); //Set 은 HashSet 의 부모니까 가능!
		int index = 0;
		while(set2.size()<6) {  //조건이 true 면 계속 돈다.
			System.out.println("index : "+ (++index));
			int num = (int)(Math.random()*45)+1;
			set2.add(num);
		}
		System.out.println("set2 : "+set2.toString());  //index 는 몇번 돌았나를 보여준다.
		
		
		//
		HashSet<String> set3 = new HashSet<String>();
		set3.add("AA");
		set3.add("DD");
		set3.add("ABC");
		set3.add("FFFF");
		System.out.println(set3.toString());  //[AA, DD, FFFF, ABC] 순서는 제멋대로
		
		Iterator<String> s =set3.iterator();
		while(s.hasNext()) {
			System.out.println(s.next());   // AA  DD FFFF  ABC      ...index 순서를 보장하지 않아요.
		}
		
		//Collections.sort(list<T>);
		//sort 함수의 parameter 로 List 인터페이스를 구현한 객체만 올수 있다. 
		//Vector, Stack, ArrayList, LinkedList >> 저장공간이 배열이기때문에 순서를 바꿀 수 있다... >> 정렬가능
		
		List list = new ArrayList(set3); //왜? 컬렉션인터페이스를  셋과 리스트가 상속하고 있고, 셋과 리스트를 셋(해쉬셋, 트리셋)  리스트(백터, 어레이리스트등이있다) ..부모가 자식객체 추소 받을수잇으니까.
		// 부모                         자식
		// 자식                      (자식) 부모
		        // ArrayList(Collection)            //Collection 부모가 자식객체인 HashSet 주소 를 받을수있다. 
		System.out.println("before 무작위 : "+ list.toString()); //before 무작위 : [AA, DD, FFFF, ABC]
		Collections.sort(list);
		System.out.println("after 정렬 : "+ list.toString()); //after 정렬 : [AA, ABC, DD, FFFF]
		//set 으로 만든것을 정렬하고 싶어지면 list 에 넣으면 된다.
		
		Collections.reverse(list);
		System.out.println("reverse 정렬 : "+ list.toString()); //reverse 정렬 : [FFFF, DD, ABC, AA
				
		
		//set 을 구현하고 있는 Hashset 은 중복되지않는 데이터를 순서없이 다룰 수있따. ex 로또번호.
		//Hastset을 사용하면 중복되지않은 데이터 집합을 보장받는다. 대신 순서는없다.  
		//Hash?  랜덤한 녀석들의 ...너무 어려움.. 원안에 김 이 박 있으면 김 넣을수 없음. 

	}

}
