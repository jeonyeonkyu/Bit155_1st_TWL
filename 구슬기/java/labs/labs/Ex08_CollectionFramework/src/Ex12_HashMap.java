import java.util.HashMap;
import java.util.Scanner;

public class Ex12_HashMap {
	public static void main(String[] args) {
		//�ϻ� ��Ȱ���� (ȸ������ -> �α��� -> id,pwd   id�� �ߺ����� ������ �ȵǰ�, pwd�� �ߺ� �־ �������
		HashMap loginmap = new HashMap();
		loginmap.put("kim", "kim1004");
		loginmap.put("scott", "tiger");
		loginmap.put("lee", "kim1004");
		
		//�츮 �ý��� ���Ե� ȸ�� ����(id, pwd)
		//id(o), pwd(o)  ȸ��(ȯ���ϸ� �ȴ�)
		//id(o), pwd(x)  ����(��й�ȣ �Է�)
		
		//id(x), pwd(o)  ...
		//id(x), pwd(x)  ... �̰� �ΰ��� �� ���� ��� �ϳ��� ���ĵ� �ȴ�.
		
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.println("ID , PWD �Է��� �ּ���");
			System.out.println("ID");
			String id = sc.nextLine().trim().toLowerCase(); //���������ϰ� ��ҹ���..? //toLowerCase ��ҹ��� �������
			System.out.println("PWD");
			String pwd = sc.nextLine().trim();
			
			if(!loginmap.containsKey(id)) {
				System.out.println("ID Ʋ����... ���Է� �ϼ���");
			}else {
				//ID(o)
				//����� �����ϸ�ȴ�.  ������ ���̵�� �����Ȱ���
				if(loginmap.get(id).equals(pwd)) {//get �� value ���� �����´�.
					System.out.println("ȸ���� �氡�氡^^");
					break; //while Ż��
				}else {
					System.out.println("����� Ȯ���ϼ���");
				}
			}
					
					
			
		}
		
	}

}
