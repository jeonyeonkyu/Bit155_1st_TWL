
public class Ex1 {
	public static void main (String[] args){
		
		System.out.println("�޼ҵ� �����ε� ����");
		Calculator lo = new Calculator();
		lo.sum("8,14");
		lo.sum(8,14);
		lo.sum("8",14);
		lo.sum(8,"14");
		lo.sum("8","14");
		
}
}