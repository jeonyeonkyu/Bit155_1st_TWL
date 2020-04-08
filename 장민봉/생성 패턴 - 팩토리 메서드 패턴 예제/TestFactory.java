
public class TestFactory {//�������� �ۼ��� ComputerFactory Ŭ������ ����Ͽ� PC�� Server Ŭ������ �ν��Ͻ��� ����.
	
	public static void main(String[] args) {
		//Computer pc = ComputerFactory.getComputer(type, ram, hdd, cpu)
		Computer pc = ComputerFactory.getComputer("pc", "2 GB", "500 GB", "2.4 GHz");
		Computer server = ComputerFactory.getComputer("server", "16 GB", "1 TB", "2.9 GHz");
		
		System.out.println("Factory pc congid :: "+pc);
		System.out.println("Factory Server config :: "+server);
	}

}
/*
��� ��
java.util ��Ű���� �ִ� Calendar, ResourceBundle, NumberFormat ���� Ŭ�������� ���ǵ� getInstance() �޼ҵ尡 ���丮 ������ ����ϰ� �ֽ��ϴ�.
Boolean, Integer, Long �� Wrapper class �ȿ� ���ǵ� valueOf() �޼ҵ� ���� ���丮 ������ ����߽��ϴ�.
*/