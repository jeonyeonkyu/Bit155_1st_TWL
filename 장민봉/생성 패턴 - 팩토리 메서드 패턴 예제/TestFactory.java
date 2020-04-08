
public class TestFactory {//예제에서 작성한 ComputerFactory 클래스를 사용하여 PC와 Server 클래스의 인스턴스를 생성.
	
	public static void main(String[] args) {
		//Computer pc = ComputerFactory.getComputer(type, ram, hdd, cpu)
		Computer pc = ComputerFactory.getComputer("pc", "2 GB", "500 GB", "2.4 GHz");
		Computer server = ComputerFactory.getComputer("server", "16 GB", "1 TB", "2.9 GHz");
		
		System.out.println("Factory pc congid :: "+pc);
		System.out.println("Factory Server config :: "+server);
	}

}
/*
사용 예
java.util 패키지에 있는 Calendar, ResourceBundle, NumberFormat 등의 클래스에서 정의된 getInstance() 메소드가 팩토리 패턴을 사용하고 있습니다.
Boolean, Integer, Long 등 Wrapper class 안에 정의된 valueOf() 메소드 또한 팩토리 패턴을 사용했습니다.
*/