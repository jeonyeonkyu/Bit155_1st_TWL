//https://kimch3617.tistory.com/entry/%EC%96%B4%EB%8C%91%ED%84%B0-%ED%8C%A8%ED%84%B4-adapter-pattern

package Adapter_Pattern.Ex1;

public class Main {
	public static void main(String[] args) {
		MallardDuck duck = new MallardDuck();
		
		WildTurkey turkey = new WildTurkey();
		Duck turkeyAdapter = new TurkeyAdapter(turkey);
		
		System.out.println("The turkey says...");
		turkey.gobble();
		turkey.fly();
		
		System.out.println("\nThe Duck says...");
		testDuck(duck);
		
		System.out.println("\nThe TurkeyAdapter says...");
		//오리 대신에 어댑터로 변환시킨 칠면조를 넘김.
		testDuck(turkeyAdapter);
	}
	
	static void testDuck(Duck duck) {
		duck.quack();
		duck.fly();
	}
}
