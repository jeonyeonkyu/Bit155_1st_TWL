class Human2{
	String name;
	int age;
}
class Test{
	Human2 add(Human2 h) {
		h.name = "아무개";
		h.age = 200;
		return h;
	}
	Human2 add(Human2 h , Human2 h2) {
		h2.name = h.name;
		h2.age = h.age;
		return h2;
	}
	
}
public class Ex15_Method_Overloading {

	public static void main(String[] args) {
		Test t = new Test();
		Human2 man = new Human2();
		Human2 man2 = t.add(man);
		System.out.println(man2.name);
		System.out.println(man2.age);
		
		System.out.println(man == man2);
		System.out.println(man.age +"/"+man.name);
		///////////////////////////////////////////
		
		Human2 m = new Human2();
		m.name = "나는 누구";
		m.age = 20;
		
	    Human2 m2 = new Human2();
	    
		Human2 m3 = t.add(m, m2);

	}

}
