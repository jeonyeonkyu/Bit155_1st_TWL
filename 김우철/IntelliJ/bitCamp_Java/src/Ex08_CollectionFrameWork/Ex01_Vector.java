package Ex08_CollectionFrameWork;
import java.util.Vector;
/*
Collection FrameWork
[다수의 데이터를] 다루는 표준화된 인터페이스를 구현하는 있는 클래스 집합

Collection 인터페이스  <- List (상속)  <----- ArrayList(^^) ....(구현)
                    <- Set  (상속)  <----- HashSet , TreeSet (구현)
Map 인터페이스 (key , value) <---- HashMap(^^) ...(구현)
-----------------------------------------------------------------
List Interface (줄을 서시오)
:순서(번호표) , 중복(허용) >> 내부적으로 데이터 (자료, 객체)들을 >> 배열관리 [홍길동][홍길동][][]

1. Vector (구버전)    - > 동기화 (멀티스레드) - > Lock (보호) - > 성능 조금... -> 한강 화장실
2. ArrayList (신버전) - > 동기화(멀티스레드)  - > Lock (x):필요에 따라서   - > 성능 고려 .. -> 한강 비빕밥 축제


Array (배열) : 고정배열
방의 개수가 한번 정해지면 (방의 크기는 변경 불가)
int[] arr = new int[5];
arr[0] = 100;....
10개의 방이 필요하다면 ... 줄이거나 늘릴수 없다 ...
int[] arr = {10,20,30};

Array
1. 배열의 크기가 고정 : Car[] cars = {new Car() , new Car()}; 방 2개
2. 접근 방법 (index (첨자)) ..index :0 ..... length -1 >> cars[0]
3. 초기 설정 변경 불가

List 인터페이스를 구현한 클래스 :: Vector , ArrayList
1. 배열의 크기를 동적으로 확장 ..... 축소가 가능  >>> 사실은 배열의 재할당
2. 순서를 유지(Array) , 순서값 (index) , 중복값 허용
3. 데이터 저장 공간 (Array)

*/
public class Ex01_Vector {
    public static void main(String[] args) {
        Vector v = new Vector();
        System.out.println("초기 default 용량 :" + v.capacity()); //10개 방 기본
        v.add("AA");
        v.add("BB");
        v.add("AA");
        v.add(100);
        System.out.println(v.toString());
        //Array >> length >> 배열의 길이
        //List >> size >> 값의 길이

        for(int i = 0 ; i < v.size() ; i++) {
            //정적(Array : arr[i] ...
            System.out.println(v.get(i)); //get 함수 값을 ,,,,,
        }
        //개선된 for문으로 출력
        for(Object obj : v) {
            System.out.println(obj);
        }
        //제너릭 >> 타입을 강제  >> String 만 담을 수 있는 그릇
        Vector<String> v2 = new Vector<String>();
        v2.add("Hello");
        v2.add("world");
        v2.add("King");
        for(String str : v2) {
            System.out.println(str);
        }
        System.out.println(v2.toString());
        System.out.println(v2.get(2)); //size 범위 내에서 처리
        System.out.println("size 데이터 개수 : " + v2.size());
        System.out.println("Capacity : " + v2.capacity());

        Vector v3 = new Vector();
        System.out.println(v3.capacity());
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
        System.out.println(v3.capacity());
        System.out.println(v3.size());

    }
}
