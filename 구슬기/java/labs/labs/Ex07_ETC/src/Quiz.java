import java.util.Scanner;

//�ֹι�ȣ : �޹�ȣ ù�ڸ� : 1,3 ���� , 2,4 ���� ��� ��� ...(����) 
//main �Լ� Scanner  ��� �ֹι�ȣ �Է¹ް�
//��:6�ڸ� ��:7�ڸ�
//�Է°� : 123456-1234567 (���ڿ�) 
//1. �ڸ��� üũ (���)�Լ� (14 ok) >>>> ������ index
//2. �޹�ȣ ù��° �ڸ��� 1~4������ ���� ��� ����Լ� -> ����� �ٽ� �Է��ϰ� ��  >>>>if
//3. �޹�ȣ ù��° �ڸ����� ������ 1,3 ���� , 2,4 ���� ��� ����Լ�  >>>> if
//4. �������� ����������
//3���� �Լ� static 
//���α׷��� ©�� ��Ģ�� ã�� ������ ������ ����. 



public class Quiz {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String jumin = "", gender = "";

		System.out.println("�ֹι�ȣ�� �Է��ϼ��� (-�� �����ؼ� �Է�)");
		jumin = sc.nextLine();
		int position = jumin.indexOf("-");
		String juminh= jumin.substring(0,position);
		String juminb=jumin.substring(position+1);
		
		
		if(jumin.length() != 14 || juminh.length() !=6 || juminb.length()!=7) {
			System.out.println("�ٽ� �Է��ϼ���");
			
		} else {
			char ch = jumin.charAt(7); // �ֹε��ڸ� ù����
			if (ch == '1' || ch == '2' || ch == '3' || ch == '4') {
				if (ch == '1' || ch == '3') {
					gender = "�����Դϴ�.";
				} else if (ch == '2' || ch == '4') {
					gender = "�����Դϴ�.";
				}
			} else {
				System.out.println("�߸��� �Է��Դϴ�. �ٽ� �Է��ϼ�");
			}
		}
		System.out.println(gender);
		
		
		


	}

}
