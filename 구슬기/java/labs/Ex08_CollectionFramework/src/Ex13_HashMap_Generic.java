import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/*
 
 
    HashMap<k,v>  key,value
    HashMap<String,String>
    HashMap<Integer,String>
    HashMap<String,Emp>
    >>put("hong",new Emp()); **********************   중요  홍씨는  Emp 안의 정보들을 가지고 있다.
 
 
 */

class Student{
	int kor;
	int math;
	int eng;
	String name;
	
	Student(String name,int kor,int mat, int eng) {
		this.name =name;
		this.kor = kor;
		this.math = math;
		this.eng = eng;
	}
}


public class Ex13_HashMap_Generic {
	public static void main(String[] args) {
		HashMap<String,Student> sts = new HashMap<String, Student>();
		sts.put("hong",new Student("홍길동",100,50,30)); //1
		sts.put("kim",new Student("김유신",50,100,60)); //2

		Student std = sts.get("hong");  //get 에 key 를 넣으면 value 를 주는데 그걸 std에 넣었다.
		System.out.println(std.kor);
		System.out.println(std.math);
		//Tip 예외적으로
		//Map안에 있는 key,value 모든것 같이...보고 싶다..출력하고싶다
		Set set = sts.entrySet(); //key+"="+value
		Iterator it = set.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());  //조합된 값,,key+"="+value  // hong=Student@38082d64   kim=Student@dfd3711
		}
		
		//만약에 value 가 Object 라면(객체라면)         //이건 그냥 외워라.......
		//Map.Entry 으로 : getkey(), getValue() 제공받아여.  인터페이스가 인터페이스를 타입으로 갖고있다.
		for(Map.Entry m : sts.entrySet()) { //key+"="+value
			System.out.println(m.getKey()+"/"+((Student)m.getValue()).name);  //hong/홍길동  kim/김유신
		}
		
		//
	}

}
