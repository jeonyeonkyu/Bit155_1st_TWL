import java.util.Scanner;

public class ����3 {

	public static void main(String[] args) {
		int a  = 0;
		int b = 0;
		int result = 0;
		String opr = "";
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("�����Է�:");
		a = Integer.parseInt(sc.nextLine());
		
		System.out.print("�����ȣ �Է�(+,-,*,/):");
		opr = sc.nextLine();
		
		System.out.print("�����Է�:");
		b = Integer.parseInt(sc.nextLine());
		
		if(opr.equals("+")) {
			result = a + b;
		}else if(opr.equals("-")) {
			result = a - b;
		}else if(opr.equals("*")){
			result = a * b;
		}else if(opr.equals("/")) {
			result = a / b;
		}else {
			System.out.println("�߸��� �Է��Դϴ�.");
			return; // �ٸ� ���� �Է��ϸ�  �� �Լ��� �������´�.
		}
		System.out.printf("%d %s %d = %d",a,opr,b,result);
	}

}
