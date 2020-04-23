import kr.or.bit.ChildA;
import kr.or.bit.ChildB;

public class Client {

	public static void main(String[] args) {
		ChildA childA = new ChildA();
        childA.someMethod();

        System.out.println("--------");

        ChildB childB = new ChildB();
        childB.someMethod();

	}

}
