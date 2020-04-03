package Ex08_CollectionFrameWork;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

public class Ex10_Set_TreeSet {

    public static void main(String[] args) {
        //Set 순서유지 (x) , 중복(x)
        HashSet<String> hs = new HashSet<String>();
        hs.add("B");
        hs.add("A");
        hs.add("F");
        hs.add("K");
        hs.add("G");
        hs.add("D");
        hs.add("P");
        hs.add("A");

        System.out.println(hs.toString());

        //HashSet  확장 >> LinkedHashSet(순서유지) >> Linked(주소 : node)
        Set<String> hs2 = new LinkedHashSet<String>();
        hs2.add("B");
        hs2.add("A");
        hs2.add("F");
        hs2.add("K");
        hs2.add("G");
        hs2.add("D");
        hs2.add("P");
        hs2.add("A");
        //정렬된다 (내림차순, 오름차순)
        //순서가 유지된다 (입력하는 순서)
        System.out.println(hs2.toString());

        //TreeSet
        //자료구조 (순서(x) , 중복(x) , 정렬(0))
        //검색하거나 정렬을 필요로 하는 데이터 집합
        //로또 ...
        //1. 이진 트리 구조를 가지고 있다
        //2. 데이터가 저장될때 정렬된다
        //로또
        Set<Integer> lotto = new TreeSet<Integer>();
        for (int i = 0; lotto.size() < 6; i++) {
            lotto.add((int) (Math.random() * 45) + 1);
        }
        //System.out.println(lotto.toString());
        Iterator<Integer> lo = lotto.iterator();
        while (lo.hasNext()) {
            System.out.println(lo.next());
        }
    }

}
/*
		int[] lotto = new int[6];
		for(int i = 0 ; i < 6 ; i++) {
			lotto[i] = (int)(Math.random()*45 + 1);
			 for(int j = 0 ; j < i ; j++) { //j < i (채워진 개수 만큼 비교)
				 if(lotto[i] == lotto[j]) {
					 i--; //point 같은 방의 값을 바꾸어여 한다
					 break;
				 }
			 }
		}
		for(int i = 0 ; i < lotto.length ;i++) {
			for(int j=i+1 ; j < lotto.length ; j++) {
				if(lotto[i] > lotto[j]) {
					int temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}
			}
		}
 */
