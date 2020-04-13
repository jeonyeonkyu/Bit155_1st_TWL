package Adapter_Pattern.Ex1;

//Duck객체 대신 Turkey라는 새로운 인터페이스를 사용해야 할 때 사용
public class TurkeyAdapter implements Duck {
	Turkey turkey;
	
	public TurkeyAdapter(Turkey turkey) {
		this.turkey = turkey;
	}
	
	@Override
	public void quack() {
		turkey.gobble();
	}
	
	@Override
	public void fly() {
		turkey.fly();
	}
	

}
