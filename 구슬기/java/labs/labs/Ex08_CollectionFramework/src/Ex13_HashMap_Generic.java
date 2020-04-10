import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/*
 
 
    HashMap<k,v>  key,value
    HashMap<String,String>
    HashMap<Integer,String>
    HashMap<String,Emp>
    >>put("hong",new Emp()); **********************   �߿�  ȫ����  Emp ���� �������� ������ �ִ�.
 
 
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
		sts.put("hong",new Student("ȫ�浿",100,50,30)); //1
		sts.put("kim",new Student("������",50,100,60)); //2

		Student std = sts.get("hong");  //get �� key �� ������ value �� �ִµ� �װ� std�� �־���.
		System.out.println(std.kor);
		System.out.println(std.math);
		//Tip ����������
		//Map�ȿ� �ִ� key,value ���� ����...���� �ʹ�..����ϰ�ʹ�
		Set set = sts.entrySet(); //key+"="+value
		Iterator it = set.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());  //���յ� ��,,key+"="+value  // hong=Student@38082d64   kim=Student@dfd3711
		}
		
		//���࿡ value �� Object ���(��ü���)         //�̰� �׳� �ܿ���.......
		//Map.Entry ���� : getkey(), getValue() �����޾ƿ�.  �������̽��� �������̽��� Ÿ������ �����ִ�.
		for(Map.Entry m : sts.entrySet()) { //key+"="+value
			System.out.println(m.getKey()+"/"+((Student)m.getValue()).name);  //hong/ȫ�浿  kim/������
		}
		
		//
	}

}
