package Ex08_CollectionFrameWork;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/*
  HashMap<k,v>
  HashMap<String,String>
  HashMap<Integer,String>
  HashMap<String,Emp>
  >>put("hong",new Emp()); ************************

*/
class Student {
    int kor;
    int math;
    int eng;
    String name;

    Student(String name, int kor, int math, int eng) {
        this.name = name;
        this.kor = kor;
        this.math = math;
        this.eng = eng;
    }
}

public class Ex13_HashMap_Generic {
    public static void main(String[] args) {
        HashMap<String, Student> sts = new HashMap<String, Student>();
        sts.put("hong", new Student("홍길동", 100, 50, 30));
        sts.put("kim", new Student("김유신", 50, 100, 60));

        Student std = sts.get("hong");
        System.out.println(std.kor);
        System.out.println(std.math);

        //Tip 예외적으로
        //Map 안에 있는 key , value 모든 같이 ...출력
        Set set = sts.entrySet(); //key+"="+value
        Iterator it = set.iterator();
        while (it.hasNext()) {
            System.out.println(it.next()); //조합된 값 key+"="+value
        }

        //만약에 value 가 Object 라면(객체)
        //Map.Entry 으로 : getKey() , getValue() 제공받아여
        for (Map.Entry m : sts.entrySet()) {
            System.out.println(m.getKey() + " / " + ((Student) m.getValue()).name);
        }
    }
}
