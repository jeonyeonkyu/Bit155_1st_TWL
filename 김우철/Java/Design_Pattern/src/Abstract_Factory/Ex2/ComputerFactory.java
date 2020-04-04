package Abstract_Factory.Ex2;

//object 구현을 매우 깔끔하게 하는 중요한 포인트 지점
//파라미터로 인터페이스를 받아 처리를 하기 때문에 구현할 것이 복잡하지 않다.
//ServerFactory와 PCFactory들을 생성하기 위해 클라이언트 코드에 접점으로 제공되는 컨슈머 클래스.
//if-else 없이도 각각 원하는 서브 클래스의 인스턴스를 생성할 수 있게 됬다.
public class ComputerFactory {
	public static Computer getComputer(ComputerAbstractFactory factory) {
		return factory.createComputer();
	}

}
