import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

public class Ex10_Set_TreeSet {
	public static void main(String[] args) {
		//Set 순서유지 (x), 중복(x)
		HashSet<String> hs = new HashSet<String>();
		hs.add("B");
		hs.add("A");
		hs.add("F");
		hs.add("K");
		hs.add("G");
		hs.add("D");
		hs.add("P");
		hs.add("A");
		hs.add("B");
		
		System.out.println(hs.toString()); //[P, A, B, D, F, G, K] HashSet 은 순서보장없이 중복없고.
		
		//HashSet 확장 >>LinkedHashSet(순서유지) >> Linked(주소: node)
		Set<String> hs2 = new LinkedHashSet<String>(); //부모타입으로 받는 습관을 들여본다. 
		hs2.add("B");
		hs2.add("A");
		hs2.add("F");
		hs2.add("K");
		hs2.add("G");
		hs2.add("D");
		hs2.add("P");
		hs2.add("A");
		hs2.add("B");
		
		//순서가 유지된다.(입력하는 순서)
		System.out.println(hs2.toString()); //[B, A, F, K, G, D, P]
		
		//TreeSet
		//정렬된다 (내리차순, 오름차순)
		//자료구조(순서(x)-들어오는 순서대로앉으세요 , 중복(x), 정렬(o)-키크기대로앉으세요) 
		//검색하거나 정렬을 필요로하는 데이터 집합에서 사용된다.
		//로또 ... 
		//1.이진트리 구조를 가지고 있다.
		//2. 데이터가 저장될때  정렬된다. (정리되어서 저장되니까!)
		//로또 만들어보쟈
		//프레임웍으로 인하여 코드의 길이가 엄청나게 줄어든다.  
		//초보일때는 남용하지말자
		Set<Integer> lotto = new TreeSet<Integer>();
		for(int i = 0;lotto.size()<6 ;i++) {
			lotto.add((int)(Math.random()*45)+1);
		}
		//System.out.println(lotto.toString()); //[6, 16, 22, 26, 34, 45]
		
		
		//Iterator 로 해본것.
		Iterator<Integer> lo = lotto.iterator();
		while(lo.hasNext()) {
			System.out.println(lo.next());
		}

	}

}
