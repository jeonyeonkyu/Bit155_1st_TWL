import java.util.ArrayList;
import java.util.Stack;

/*
 �ƹ��� �����ص� ����ħ�� ����.
 Generic     --ū�׸��� ���� ���Ĵ�°Ͱ��� ���� ��������..
 jdk 1.5 ���� �ִ�.
 C# ,java �ʼ� ���... 
 
 Collection Ŭ��������(��������� Ÿ�� :Object) -���� �� ���� �� �ִ�. �ٸ� ������ ���帯������ ���ʸ��� ���� ����.
 1. Object Ÿ�� ���� >> Ÿ�� ? >> Ÿ���� �����ϸ� ���? �ϰ� ���ΰ� ���ʸ�
 2. Ÿ���� ������(Ÿ�� ����)   �ϸ鼭 �������� �������� ��Եȴ�.
 3. ����ȯ ��ü�� �����ش�.  ex) (car)obj �̷���...       Object �� ������ ��� �ٿ�ĳ������ �ؿ����ϴµ�   �װ� ���ص���!!!!
 
 ����� ���� : Ŭ���� �����Ҷ� Ÿ���� �����ϵ��� ������
 
 */
class MyGen<T>{ //Type parameter
	T obj;
	
	void add(T obj) {
		this.obj = obj;
	}
	T get() {
		return this.obj;
	}
}
class Person extends Object{
	int age=100;
}

public class Ex06_Generic {
	public static void main(String[] args) {
		MyGen<String> mygen = new MyGen<String>(); //��ü�� ���鶧 ����� �ʿ��� Ÿ���� ���� �� �� �ִ�. 
		mygen.add("���ڿ�");
		
		String result = mygen.get();
		System.out.println(result);
		
		System.out.println("--------------------------------------------------");
		//���ʸ� ���� �غ���
		ArrayList list = new ArrayList(); //�����ϴ� �������(Array >> Ÿ�� >>default object)
		list.add(10);
		list.add(new Person());
		list.add("ȫ�浿"); //Object �� �� ��Ʈ, ����, ��Ʈ�� �ٵ�
		
		//���
		for(Object obj : list) {
			//System.out.println(obj);   //��ü�� �ּҰ��� ���´�.   
//			Person P = (Person)(obj); //�̷��� ��ü���� ������ �ȳ��´�.
//			System.out.println(.obj);
			//�Ǵ�(��ü, �� ����,,, ����ȯ���� �ؾߵȴ�)
			if(obj instanceof Person) { //obj ��� ��ü�� �޽� Ÿ���̶��
				Person p = (Person)(obj);
				System.out.println(p.age);
			}else {
				System.out.println(obj);   //�̷��� �����ؾ� �� ������ �ִ�.
			}
		}
		System.out.println("--------------------------------------------------");
		//���ʸ����
		ArrayList<Person> plist = new ArrayList<Person>();  //Person Ÿ������ �����ص�
		plist.add(new Person());
		plist.add(new Person());
		for(Person p : plist) {
			System.out.println(p.age);
		}
		
		System.out.println("--------------------------------------------------");
		
		//MyGen �� ���ʸ����~
		MyGen<Person> myobj = new MyGen<Person>();
		myobj.add(new Person());
		Person pe = myobj.get();
		System.out.println(pe.age); //100
		
		System.out.println("--------------------------------------------------");
		//Stack �� ���ʸ����   --�����ʿ�!
		Stack<String> s = new Stack<String>();
		s.push("���ڿ�");
		String str = s.pop(); //Ƣ����� ���� String �̴ϱ� String ������ ����ش�.
		System.out.println(str);
		
		
				

	}

}
