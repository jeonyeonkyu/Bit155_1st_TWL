
public class MAIN {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("�޼ҵ� �����ε� ����");
		
		Calculator cal = new Calculator();
		
		System.out.println("1. String�� �Ű�����");
		cal.sum("8,14");		
		System.out.println("2. int�� �Ű�����, int�� �Ű�����");
		cal.sum(8,14);
		System.out.println("3. int�� �Ű�����, String�� �Ű�����");
		cal.sum(8,"14");
		System.out.println("4. String�� �Ű�����, int�� �Ű�����");
		cal.sum("8",14);		
		System.out.println("5. String�� �Ű�����, String�� �Ű����� ");
		cal.sum("8","14");
	}
	
	

}
