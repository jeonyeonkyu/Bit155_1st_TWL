/*
 1.�ڹٴ� �ý����� �����ϴ� �⺻ 8���� Ÿ���� ����(�ڷ���)
 2.8���� �⺻ Ÿ���� ���� �����ϴ� Ÿ��
 3.���� -> ����   -> (��������, 0, ��������) ->byte(-128~127)
                                   ->char (�� ���ڸ� ǥ���ϴ� Ÿ��)
                                   >>�ѹ���(2byte) >> �ѱ�1�� (2byte)
                                                 >> ������, Ư��, ���� (1byte)
                                                 >> ���� >> char (�ѱ�, ������, Ư��, ����)
                                                                                                           ������� �ѱ��� ǥ������ (����������) unicode
                                    ->short (c��� ȣȯ��  : 2byte)
                                    ->int  (-21�� ~ 21�� : 4byte) **Java ���� ���� �⺻ Ÿ�� **
                                    ->long  (8byte)
                                

                   �Ǽ�(�ε��Ҽ���)-> float(4byte) , double(8byte)
                   >>���е�(ǥ�� ������ ũ��) >> double ** java �Ǽ� ���� �⺻ Ÿ�� **
      ��  -> ��, ���� -> boolean >> ���α׷��� ���� �帧���� 
       
   ** �ñ����� : ���ڿ��� ǥ�� >> "
   *"ȫ�浿" , "HELLO"
String �� Ŭ���� �Դϴ�. (����Ÿ��) String s = new String("ȫ�⵿");
�׷����� �ұ��ϰ�.....
�̾߱��ϱ� �������� String �׳� ���ڿ��� �����ϴ� Ÿ��
int, double ó�� ����ϼ���
�׷��� ���� �������ϴ�.   

�ڹٴ� ũ��
1.��Ÿ�� > ����, �� 8���� > value type
2.����Ÿ��> Ŭ����, �迭> ������ ���� ����Ǵ� ���� �ƴ϶� �ּҰ��� ���� (������) > ref type


*** class == ���赵 == Type


*/
class Car{ //Car�� Type�̴�. Car�� ���赵�̴�. >> ��üȭ�� �깰 >> ��üȭ(�޸�)
	String color;
	int window;
	
}

public class Ex03_Datatype {

	public static void main(String[] args) {
		String str = "ȫ�浿";
		int age = 100;

		Car c; //���� main �ȿ� �ִ� local
		//System.out.println(c); //�ʱ�ȭ�� ���� �ʾұ� ������
		//c ��� ������ �ʱ�ȭ >> �ּҸ� ������ ���ؼ��� new�� �̿��ؾ���
		c = new Car();
		System.out.println(c); //Car@15db9742
		
		//����� �ʱ�ȭ
		Car c2 = new Car(); //����� ���ÿ� �ʱ�ȭ
		System.out.println(c == c2);  //false
		System.out.println(c2);
		c2.window = 100;
		c2.color = "blue";
		
		
		int i = 10; //����� �Ҵ�
		
		int j; // ����
		j = 20; //�Ҵ� �и�

		int k;
		k = j;
		System.out.println("k :" + k);
		k = 300;  //�̷��� �ϸ� k�� 300  j �� 20
		System.out.println("k :" + k);
		
		//int i = 200; ���� �Լ��ȿ� ���� ������ �����Ҽ�����
		//int p, g, q; //�̷��� �ҰŸ� array ��� (�迭)  int[] arr = new int[3]; >>arr[0] , arr [1]
		
		//int (-21�� ~ 21��)
		//Today point
		//literal >> �ִ� �״��
		//���� ���ͷ� : 10000000000 : [�ڹ��� ���� ���ͷ� ���� default >> int ] 
		//���� ���ͷ� : A
		//int p = 10000000000; // The literal 10000000000 of type int is out of range.
		//int p = 10000000;
		//int p = 10000000000;
		//���̻� : L, l ������ �����ֱ�
		
		long num2 = 100;
		long num3 = 10000000000L; //int ������ ǥ���ϴ°� ����Ʈ���� L�� ���־�� ��
		System.out.println(num3);
		
		
		//int p = 10000000000l; //Type mismatch: cannot convert from long to int
		
		//char : 2byte (������)
		//�ѹ��ڸ� ǥ���ϴ� �ڷ���(������ Ÿ��)
		//�Ϲ���
		//1. �ѱ� 1 �� : 2byte
		//2.������, Ư������, ���� :1byte
		//unicode >> �ѱ�, ���� >> 2byte ���
		//char �� �� ���ڸ� �޴´�.
		// Today point
		//���ڿ� : "��" ,"Hello" >> String str = "�����ٶ�"
		//���� : '��', 'a'      >> char ch = 'A'
		
		char single = '��';
		System.out.println(single);
		char ch = 'A';
		System.out.println(ch);
		//char ���ڸ� ���������� ���������δ� �������� ������ �ִ�.(�ƽ�Ű �ڵ�ǥ����)
		//casting (Ÿ�Ժ�ȯ)

		int intch = 'A'; //�ڵ����� (����������) �Ͻ��� �� ��ȯ
		System.out.println("intch : " + intch);  //intch : 65
		
		System.out.println((int)ch); //type casting : 65
		
		char ch2='a';
		System.out.println(ch2);
		System.out.println((int)ch2);
		
		int intch2 = 65;
		char ch3 = (char)intch2; //��������[������������ ���� ������ Ÿ���� ����]
		//int��  char ���� ũ�ϱ� char�� �����ִ� �׸��� �ѹ� �������� �װ� ��ȣ()
		//������ ����ȯ (����� ����ȯ)
		//Key Point : 65��� ���ڰ� char Ÿ�Կ� ���ϴ� ������ �ս� �߻� ���� �Ҵ� ����
		//ū ���� ���� ������ �ٲ� ������ ũ�Ⱑ ���� ������ [�� Ÿ�Կ� �´�����ȯ�� ���� �۾�]�� �Ѵ�. �ս��� ����
		
		int intch3 = ch3; //����ȯ.. �ڵ����� ��ȯ.. �Ͻ��� ����ȯ
		//�����Ϸ��� �ڵ����� �ڵ带 ������Ѵ�
		//int intch3 = (int)ch3;
		System.out.println(intch3);
		
		//Today point
		// 1. �Ҵ翡�� ������ ������ �ִ� ���� �������� [[������ Ÿ���� ����]]
		// 2. ������ Ÿ�� ũ�⸦ Ȯ������
		// 3. ūŸ�Կ��� ����Ÿ���� ����������. 
		// 4. ���� Ÿ�Կ��� ū Ÿ�԰��� �� ���� (casting)
		//int -> char ��ȯ  >>> char <- (char)int
		//char -> int ��ȯ >>>  int <- char ����... >> ����������(�����Ϸ���) >> int <-(int)char
		
		
	    //�̷��� ������ ��ȯ��Ű�� ��ȯ�սǰ� �Ǵ� ������ ���� �߻�
		//int intvalue = 10165468;
		//byte bytevaule = (byte)intvalue;
		//System.out.println(bytevalue); //-36 ������ ��
		
		
		int intvalue = 10165468;
		byte bytevaule = (byte)intvalue; //�̷��� �ϸ� ���Ĺ��� ����Ʈ �丸�ѵ� 10165468�� ������ϱ�
		System.out.println(bytevaule);
	 
		//String (���ڿ�) Ÿ������ ����
		String name = "hello world";
		System.out.println(name);
		
		String name2 = name + "�ȳ��ϼ���"; // + �꽽, ����
		System.out.println(name2);
		//DB(oracle >> + ������ (�꽽), ���տ����� ||)
		//'hello world'  || '������'
		
		//TIP) java Ư������ ����ϱ�
		//Ư���� ���ڸ� �����ϱ� ���ؼ� : \ �������� �ڿ�  
		char sing = '\''; //�������� �ڿ� �ִ� �����̼��� ���� �����;�....
		System.out.println(sing);
		
		//ȫ"��"�� �̶�� ���ڸ� String ������ �����ϰ� ȭ�� ����غ�����
		
		String ename = "ȫ\"��\"��";
            
		
		String str3 = "1000";
		String str4 = "10";
		
		String result = str3 + str4;
		System.out.println(result); //"100010"
		
		//C:\temp ȭ�鿡 ����ϼ��� (String ������ �ְ� ȭ�� println ���)
		
		String path = "C:\\temp";  //   \t��  Tab Ű�̴�     \n  -> new line)
		System.out.println(path);
		
		
		//�Ǽ�(�ε��Ҽ���) : ���ٴϴ���
		//float (4byte)
		//double (8byte) : **�Ǽ��� �⺻Ÿ��(���ͷ� ��) double***
		
		float f = 3.14f; //3.14 ���� double�̶�� �׸��ȿ� ������� ,,ū�� �����ſ� ������ϱ� �������°��� //������ �׸����� ������.
		//float f = (float) 3.14;                 //f�� �ڿ� ���ָ� ������ �����. (�ڹپ�, �̰� �÷�Ÿ���̾� �̷���) ���̻� f or F
		//double f = 3.14;                //�Ǽ� ���ͷ����� ������ ����� ���⶧���� ���� ����
		
		float f2 = 1.123456789f;    //�Ǽ� ���ͷ��� ������!!!!double�� ����!!!!
		System.out.println("f2 : "+f2);  //f2 : 1.1234568  ��� ������ �ݿø��ϰ� ��������
		//�ݿø�ó���� default. �� ( �뷫 �Ҽ������� 7�ڸ� ���� Ȯ���� �ݿø�)
		
		double d = 1.123456789123456789; // double ��  �뷫 �Ҽ������� 16�ڸ� ǥ��
		System.out.println("d: "+d); //d: 1.1234567891234568 �ݿø�
		
		//Quiz
		// byte : -128 ~ +127
		byte q = (byte)128;  //�������ͷ��� ������ int!!!!!!!!!   128�̶�� ���� ���� �⺻������ int �׸��� ���������
		System.out.println("q : "+q); //q : -128        �ִ밪�� �Ѿ�� -128 ���� ������γ���.(overflow �� ��ȯ��)
		
		//double d2 = 100; //�Ͻ��� ����ȯ
		double d2 = (double)100;  //ĳ���� ����
		System.out.println(d2); //100.0 (�Ǽ��� ���� ����)
		
		//Quiz
		double d3 = 100;
		int i5 = 100;
		
		//int result2 = d3 + i5; //�̰� ����  //int = int + double (���� = ���� + �Ǽ�)
		
		
		//1.  double result2 = d3 + i5;       �´� �������� 2��3���� �����ͼս��̵�.
		
		
		//2.  int result2 = (int)d3 + i5;     (�����ͼս�) ����: d3 = 3.1245
        
		
		//3.  int result2 = (int)(d3 + i5);   (�����ͼս�) ���� : d3 = 3.1245
		
		
		//Today Point
		//����Ÿ�� + ūŸ�� >> ūŸ��
		//Ÿ�԰� ����ȯ>> ������ ������ ���� ���� ���� ������ Ÿ���� ���� �Ǵ�����.
		//����� ����ȯ (casting) (�ٲܷ����ϴ�Ÿ�� �Ǵ� ���� ����ϸ�� )
		
		
		int i6 = 100;
		byte b2 = (byte)i6; //����� ����ȯ
		System.out.println(b2);
		
		byte b3 = 20;
		int i7 = b3;
		//�����Ϸ��� ���������� (int)b3 ���� // �Ͻ��� ����ȯ
		
		
		
		
		
		
		
		

		
		
		
				
		
		
		
		
		
	
		
	}

}
