import kr.or.bit.Emp;

class Test2 {
	int x = 100;

	void print() {
		System.out.println("부모함수(Test2)");
	}
}

class Test3 extends Test2 {
	int x = 300; // 부모 무시하기. //이렇게 하지마세용.

	@Override
	void print() {
		System.out.println("자식이 부모함수 재정의...");
	}

	// 오버로딩(상속과 상관이 없다
	void print(String str) {
		System.out.println("나 오버로딩 함수야" + str);
	}

	// 부모함수 호출하는 함수.
	void sprint() {
		super.print();
	}
}

public class Ex05_Inherit_Override {

	public static void main(String[] args) {
		Emp emp = new Emp(1000, "김유신");
		System.out.println(emp.toString()); // kr.or.bit.Emp@15db9742
		// Object 가 가지고 있는 toString()은 객체의 주소를 리턴한다.
		System.out.println(emp); // toString() default 값 //kr.or.bit.Emp@15db9742
		// toString() 함수를 재정의 한후에는 내마음이야 가 나옴.
		// Generate toString() 가지고 있는 멤버필드를 보여주도록 오버라이드됨.
		// Emp [empno=1000, ename=김유신]
		// 재정의를 하게 되면 재정의 된 함수만 불러오게 된다. 부모꺼 부를수없음
		// 부모꺼 부르고 싶으면 super를 쓰면됨.

		Test3 test3 = new Test3();
		test3.print();
		test3.print("오버로딩");
		System.out.println(test3.x);

	}

}
