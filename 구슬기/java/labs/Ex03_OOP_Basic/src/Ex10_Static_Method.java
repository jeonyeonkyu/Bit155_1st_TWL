
public class Ex10_Static_Method {
	
	
	public void method() {   //method��  Ex10_Static_MethodŬ������ �����ִ� ����̴ϱ� Ŭ����(Ex10_Static_Method)�� new �������.
		System.out.println("�� �Ϲ� �Լ���");
	}
	
	public static void smethod() {   //��� Class Area �� �����ϱ� �׳� Ŭ���� �̸����� �����ϸ� ��.
		System.out.println("�� static �Լ���");
	}
	

	public static void main(String[] args) {
		//�� �Ϲ��Լ��߸� ����غ�����\
		//java Ex10_Static_Method
		Ex10_Static_Method method = new Ex10_Static_Method(); 
		method.method();
		
		
		Ex10_Static_Method.smethod();//Ex10_Static_Method Ŭ���� �̸� ���� ����


	}

}
