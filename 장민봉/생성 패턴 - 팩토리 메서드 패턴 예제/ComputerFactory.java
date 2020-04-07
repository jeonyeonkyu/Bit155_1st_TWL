
public class ComputerFactory {//팩토리 클래스
	
	public static Computer getComputer(String type, String ram, String hdd, String cpu) {
		if("PC".equalsIgnoreCase(type))
			return new PC(ram, hdd, cpu);
		else if("Server".equalsIgnoreCase(type))
			return new Server(ram, hdd, cpu);
		
		return null;
	}

}
/*
ComputerFactory 클래스의 getComputer 메소드를 살펴보면 static 메소드로 구현되었다는 점을 살펴볼 수 있고, 
메소드 내부 코드를 보면 type의 값이 "PC"일 경우 PC 클래스의 인스턴스를, "Server"일 경우 Server 클래스의 인스턴스를 리턴하는 것을 볼 수 있습니다.
이렇듯 팩토리 메소드 패턴을 사용하게 된다면 인스턴스를 필요로 하는 Application에서 Computer의 Sub 클래스에 대한 정보는 모른 채 인스턴스를 생성할 수 있게 됩니다.
이렇게 구현한다면 앞으로 Computer 클래스에 더 많은 Sub 클래스가 추가된다 할지라도 getComputer()를 통해 인스턴스를 제공받던 Application의 코드는 수정할 필요가 없게 됩니다.

팩토리 패턴의 장점
팩토리 패턴은 클라이언트 코드로부터 서브 클래스의 인스턴스화를 제거하여 서로 간의 종속성을 낮추고, 결합도를 느슨하게 하며(Loosely Coupled), 확장을 쉽게 합니다.
예를 들어, 위 예제에서 작성한 클래스 중 PC class에 대해 수정 혹은 삭제가 일어나더라도 클라이언트는 알 수 없기 때문에 코드를 변경할 필요도 없습니다.
팩토리 패턴은 클라이언트와 구현 객체들 사이에 추상화를 제공합니다.
 */
