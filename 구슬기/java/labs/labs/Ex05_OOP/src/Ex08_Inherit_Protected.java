import kr.or.bit.Pclass;

/*
 
 public, default, private, 상속관계 >> protected(상속이있어야 있는 제어자)
 
 양면성: 박쥐(default, public)
>> 상속이 없는 클래스 안에서 protected 접근자는 default 와 같다.
>> 왜? 상속이 없는 상황에서는 protected 접근자는 의미가 없다.

당신이 내가 만들 클래스를 사용한다면 당신이 재정의했으면 좋겠어==의도
퍼블릭은 해도되고 안해도됨
프로텍티드는 재정의하면 좋겠는데 안해도돼..요런느낌.

상속관계에서만 프로텍티드.
자식클래스에서 조상클래스로 접근가능하고. 참조변수에서는 접근 불가능할걸?
상속관계에서만 오버라이드. 

 */
class Dclass {
	public int j;
	private int o;
	int p; // default.. 안써도 나오니까 명시하지 않는다.
	protected int k;
}

class Child2 extends Pclass {
	void method() {
		this.k = 1000; // 상속관계에서 자식은 부모의 protected 접근자 자원을 public처럼 사용가능하다.(상속관계에서만)
		System.out.println(this.k);
	}
}

public class Ex08_Inherit_Protected {
	public static void main(String[] args) {
		Dclass dc = new Dclass();
		// dc.j ok(접근가능하다는뜻)>> public
		// dc.p ok >> default (같은폴더내에서는 다 보여준다.)
		// dc.k ok >> (protected 같은 폴더 안에서 default)
		// dc.o >> private (x) 같은 클래스만 접근가능
		// 결국 protected 상속관계에서만 사용된다!!

		// 다른 폴더(package)
		Pclass pc = new Pclass();
		// pc.j public 얘만 보임.
		// pc.p
		// pc.k
		// pc.o
		Child2 ch = new Child2();
		ch.method();

	}

}
