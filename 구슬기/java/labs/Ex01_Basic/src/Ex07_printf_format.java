import java.util.Scanner;

public class Ex07_printf_format {

	public static void main(String[] args) {
		//Java : System.out.println();
		//C# : Console.WriteLine();
		
		System.out.println();   //ln =new line �����ٷ� �Ѱܶ�(�ٹٲ�)
		System.out.print("A");
		System.out.print("B");
		System.out.println("C");
		System.out.println("D");
		
		int num = 100;
		System.out.println(num);
 		System.out.println("num ���� : " + num + "�Դϴ�");
 		//����ϴ� ������ ���غ��°�: ����format
 		System.out.printf("num ����: %d �Դϴ� \n",num);  //  %d �ڸ��� �����̴�.
 		//format ���� ���� (���)
 		// %d (10���� ������ ����) ���� >> d��� �ڸ��� �־��
 		// %f (�Ǽ�)
 		// %s (���ڿ�)
 		// %c (����)
 		// \t  tab , \n enter(�ٹٲ�)
 		System.out.printf("num ���� [%d] �Դϴ� �׸��� [%d] �� �־�� \n",num , 5555); //d �ڸ��� �޸� ������ ���� ������� �ִ°Ͱ���
 		
 		float f = 3.14f;  //(����� ��ȯ)
 		System.out.println(f);
 		System.out.printf("f �������� %f �Դϴ� \n" , f);
 		
 		//�ݴ��
 		//cmd  (console) â���� ������ �Է� �ޱ�
 		//java.util.Scanner 
 		Scanner sc = new Scanner(System.in);
 		//����Ű...
 		//ctrl + shift + o  >> import ���� �ڵ� �����ϱ�
 		//System.out.println("���� �Է��ϼ���");
 		//String value = sc.nextLine();  //�Է��ϰ� ���� �Ҷ����� ���.....���ڿ��� ��ȯ
 		//System.out.println(value);
 		
 		//int number = sc.nextInt();
        //System.out.println("������ : " + number);
 
        //float fnumber = sc.nextFloat();
        //System.out.println("�Ǽ��� : " + fnumber);
        
        //������� : nextInt , nextFloat ���ٴ� nextLine() ���� �������
        //Today Point
        //[���ڸ� -> ���ڷ� (����,�Ǽ� )]
        //Integer.parseInt("11") ���ڿ��� ������
        //Float.parseFloat("3.111") ���ڿ��� �Ǽ���
        //Double.parseDouble(s)
        
 		
 		//System.out.println("���� �Է��ϼ���");
 		//int num2 = sc.nextInt();
 		//System.out.println("������ : " + num2);
 		System.out.println("���� �Է��ϼ���");
 		int str2 =Integer.parseInt(sc.nextLine());
 		System.out.println("���ڰ�: "+str2+1);
 		
 		//ȭ�鿡 ����ϴ°� �ٸ��� �ϴ°�
 		//� �ڸ��� �����ϴ°�
 		//���� �Է��ϴ¹��
 		//��ĳ�ʷ� ���� �Է��ϱ��������� �����ִ°� 
 		//�ؽ�Ʈ�������� �޾Ƽ� �ʿ��� ���·� ������ �ٲ���. �̷��� �����ϴ°��� �÷����� �Ǵ���.
 		
 		
 		//Tip
 		//���ڸ�=> ���ڷ�
 		String data = String.valueOf(10000);
 		System.out.println(data);
 		
 		
 		
 		
 		
 		
	}

}
