
public class ComputerFactory {//���丮 Ŭ����
	
	public static Computer getComputer(String type, String ram, String hdd, String cpu) {
		if("PC".equalsIgnoreCase(type))
			return new PC(ram, hdd, cpu);
		else if("Server".equalsIgnoreCase(type))
			return new Server(ram, hdd, cpu);
		
		return null;
	}

}
/*
ComputerFactory Ŭ������ getComputer �޼ҵ带 ���캸�� static �޼ҵ�� �����Ǿ��ٴ� ���� ���캼 �� �ְ�, 
�޼ҵ� ���� �ڵ带 ���� type�� ���� "PC"�� ��� PC Ŭ������ �ν��Ͻ���, "Server"�� ��� Server Ŭ������ �ν��Ͻ��� �����ϴ� ���� �� �� �ֽ��ϴ�.
�̷��� ���丮 �޼ҵ� ������ ����ϰ� �ȴٸ� �ν��Ͻ��� �ʿ�� �ϴ� Application���� Computer�� Sub Ŭ������ ���� ������ �� ä �ν��Ͻ��� ������ �� �ְ� �˴ϴ�.
�̷��� �����Ѵٸ� ������ Computer Ŭ������ �� ���� Sub Ŭ������ �߰��ȴ� ������ getComputer()�� ���� �ν��Ͻ��� �����޴� Application�� �ڵ�� ������ �ʿ䰡 ���� �˴ϴ�.

���丮 ������ ����
���丮 ������ Ŭ���̾�Ʈ �ڵ�κ��� ���� Ŭ������ �ν��Ͻ�ȭ�� �����Ͽ� ���� ���� ���Ӽ��� ���߰�, ���յ��� �����ϰ� �ϸ�(Loosely Coupled), Ȯ���� ���� �մϴ�.
���� ���, �� �������� �ۼ��� Ŭ���� �� PC class�� ���� ���� Ȥ�� ������ �Ͼ���� Ŭ���̾�Ʈ�� �� �� ���� ������ �ڵ带 ������ �ʿ䵵 �����ϴ�.
���丮 ������ Ŭ���̾�Ʈ�� ���� ��ü�� ���̿� �߻�ȭ�� �����մϴ�.
 */
