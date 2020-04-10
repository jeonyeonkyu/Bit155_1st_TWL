import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Ex02_ArrayList {

	//Today Point
	public static void main(String[] args) {
	ArrayList arraylist = new ArrayList();
	
	arraylist.add(100);
	arraylist.add(200);
	arraylist.add(300);
	
	for(int i = 0; i<arraylist.size() ; i++) {
		System.out.println(arraylist.get(i));      
	}
	
	System.out.println(arraylist.toString());   //[100, 200, 300]
	
	//특정방의 값을 갖고 싶을때
	System.out.println("특정방에 있는 값:"+ arraylist.get(0)); //특정방에 있는 값:100
	
	//add 순차적으로 데이터 넣기
	//arraylist.add overloading....index , element
	arraylist.add(0, 111); // 0번째 방에 111을 줬다.   덮어쓰지않는다.
	System.out.println(arraylist.toString()); //[111, 100, 200, 300] 특정방에 값을 주면 이렇게 값을주고 기존값들이 뒤로 밀려난다.
	arraylist.add(4, 444);
	System.out.println(arraylist.toString()); //[111, 100, 200, 300, 444]   
	
	//비순차적인 데이터 추가, 삭제 >> ArrayList (순서가 있는 데이터 집합)
	//천명일경우에 0번방에 끼워넣으면 데이터들이 1000번 움직여야 하는...별로좋지않다.
	//순차적인 데이터 추가, 삭제를 좋아한다.^^*  이미 차있는 방 뒤에 추가하고, 뒤에서 부터 잘라내는 삭제를 좋아한다. 
	
	//데이터 삽입(add) : 중간>> 나머지 데이터 이동
	//데이터 삭제...
	//arraylist.remove(index)
	//arraylist.add(index, element);
	
	//ArrayList 가 가지는 함수를 학습하면 된다!!!  마치 스트링때 함수배운것처럼
	//내부값 탐색후 알려주는 함수 contains
	System.out.println(arraylist.contains(200));  //200이 포함되어있으면 true  
	System.out.println(arraylist.contains(5555)); //false
	
	//isEmpty   너 비어있니?
	System.out.println(arraylist.isEmpty()); //false 나 비어있지않아.
	                                         //true  >> size ==0 
	
	//clear  
	arraylist.clear(); //siza ==0
	System.out.println(arraylist.isEmpty()); //ture
	
	//다 지운후 만들면 0번부터 채워진다. 
	arraylist.add(101);
	arraylist.add(102);
	arraylist.add(103);
	System.out.println(arraylist.toString()); //[101, 102, 103] 
	
	//remove 삭제
	System.out.println("삭제전 :"+ arraylist.size());   //삭제전 :3
    Object value = arraylist.remove(0);              //0번째 방의 값을 삭제       
    System.out.println("삭제된 데이터:"+ value);         //삭제된 데이터:101     비어있지않고 그자리를 채우기위해 뒤에 애들이 당겨진다.
    System.out.println(arraylist.toString());        //[102, 103]
    
    //POINT-----------------------------------------------------------------------------------------------
    //개발자..... 일상다반사처럼 사용한다...어렵지만
    List li = new ArrayList(); //다형성...?     List는  ArrayList  Type 의부모다      
                               // li 가 다양한 애들을 받을수 있다.      다형성 >> 확장성, 유연성
    //li.add(e)
    //ArrayList alist = new ArrayList();   //이렇게 써도 문제는 없다.    이거보단 다형성 쓰는 걸 좋아한다.
    li.add("가");
    li.add("나");
    li.add("다");
    li.add("라");
    
    List li4 = li.subList(0, 2);   //sublist가 만들어주는 데이터가 결국에는 순서가 있는 데이터 집합이구나. 왜? List로 받았으니까
    System.out.println(li4.toString()); // [가, 나]   
    
    ArrayList alist = new ArrayList();
    alist.add(50);
    alist.add(1);
    alist.add(7);
    alist.add(40);
    alist.add(45);
    alist.add(3);
    alist.add(15);
    
    //Arrays.Sort(a);
    
    System.out.println("before : "+ alist.toString());  //before : [50, 1, 7, 40, 45, 3, 15]
    Collections.sort(alist);    //초보개발자가 이거 쓰면 실력이 늘지 않는다... 
    System.out.println("after : "+ alist.toString());  //after : [1, 3, 7, 15, 40, 45, 50]
   
    //[1, 3, 7, 15, 40, 45, 50]  큰값순으로 정렬하는 방법?  이미 sort로 정렬된거를 뒤집기 
    
    Collections.reverse(alist);   
    System.out.println("reverse : "+ alist.toString()); //reverse : [50, 45, 40, 15, 7, 3, 1]
    
    //배열의 단점 
    //크기를 변경할수 없다.
    //비 순차적인 데이터의 추가, 삭제에 시간이 만ㅎ이 걸린다.  데이터를 추가하거나 삭제하기 위해 많은 데이터를 옮겨야 한다. 그러나 순차적인추가와 순차적인 데이터삭제는 빠르다.  누구나가면 나가고 자리 다바꾸고 나간다. 
    
 
    
   
    
	}

}
