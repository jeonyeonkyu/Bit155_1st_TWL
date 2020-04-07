
public abstract class Computer {//슈퍼클래스
	//객체를 생성하는 인터페이스는 미리 정의하되, 인스턴스를 만들 클래스의 결정은 서브 클래스 쪽에서 내린다.	
	//슈퍼 클래스 : 여러개의 서브 클래스를 가지 ㄴ슈퍼 클래스가 있을때 인풋에 따라 하나의
	//자식 클래스의 인스턴스를 리턴해주는 방식
	//팩토리 메서드 패턴에서 클래서의 인스턴스를 만드는 시점을 서브 클래스로 미룬다.
	public abstract String getRAM();
	public abstract String getHDD();
	public abstract String getCPU();
	
	@Override
	public String toString() {
		
		return "RAM = " +this.getRAM()+", HDD = "+this.getHDD()+", CPU = "+this.getCPU();
	}


}
