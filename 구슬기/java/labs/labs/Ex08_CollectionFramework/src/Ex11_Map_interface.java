import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/*
 Map 인터페이스
 Map <<(키,값) 쌍의 구조를 갖는 배열
 ex)지역번호(02,서울)(031,경기)
 key:중복(x)
 value : 중복(o)
 
  Map도 generic 지원
 
 
 Map 인터페이스를 구현하는 클래스
 구버전 : HashTable(동기화)           (이젠 거의 안쓰이고 이름만 존재하는 수준이다..)
 신버전 : HashMap(동기화를 강제하지 않아요) : 성능고려
 지금까지 (Thread를 배우지 않으면 동기화는 의미가 없다.)
 */
public class Ex11_Map_interface {
	public static void main(String[] args) {
		HashMap map = new HashMap();
		map.put("Tiger", "1004"); //Object Type이라서아무거나 들어올수있다.
		map.put("scott", "1004");
		map.put("superman", "1004");
		
		System.out.println(map.containsKey("tiger")); //대소문자 구별해줘야하기땜에  false   너 이런 키있니?
		System.out.println(map.containsKey("Tiger"));  //true
		System.out.println(map.containsValue("1004")); //true                      너 이런 밸류있니?
		
		//key 제공하면  value 값을 얻는다
		System.out.println(map.get("Tiger"));  //value : 1004
		System.out.println(map.get("hong"));   //해당되는 key 없으면 null반환
		
		map.put("Tiger","1005");  // 키가 같으면 중복값이 있다고 안들어 가는게 아니라. 아! 타이거의 밸류값을 바꾸고 싶구나?    value 값 바뀜..
		System.out.println(map.get("Tiger")); //1005 로 바뀜
		System.out.println(map.size()); //3
		
		Object value = map.remove("superman");  //값은 지우면서 value 값을 value 변수에 할당한다.
		System.out.println("value : "+ value);
		System.out.println(map.toString()); //{scott=1004, Tiger=1005}
		
		System.out.println("-------------------------");
		
		Set set = map.keySet(); //key의 집합은 (순서(x), 중복(x) >>그럼 담을 수 있는 그릇은 Set 이다.  
		Iterator it = set.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
		Collection vlist = map.values(); //value만을 담는 집합
		System.out.println(vlist.toString());
		
		
		
	}

}
