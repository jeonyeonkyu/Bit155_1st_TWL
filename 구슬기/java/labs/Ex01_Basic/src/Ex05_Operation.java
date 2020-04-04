
public class Ex05_Operation {

	public static void main(String[] args) {
		int result = 100/100;
		System.out.println(result);//2
		
		result = 13/2;  //6  �� ���� , �������ȳ���
		System.out.println(result);
		
		//�������� ���ϴ� ������(%)
		result = 20%6;
		System.out.println(result);//2
		
		//���� , ���� ( ������ ������ : ++ , --) 1������, 1�� ����
		int i = 10;
		//i = i + 1;
		++i; //��ġ ����
		System.out.println("��ġ i : "+ i);
		i++; //��ġ����
		System.out.println("��ġ i : "+ i);
		
	    // ���� ȥ�� ���������� ��ġ �� ��ġ�� �ǹ� ����
		
		//Point (������ ��ġ, ��ġ ����)
		int i2 = 5;
		int j2 = 4;
		
		int result2 = i2 + ++j2;
		System.out.println("result2 : " + result2 +" j2 : " + j2);
		//result2 : 10 j2 : 5   i2 : 5
		
		
		result2 = i2 + j2++;
		System.out.println("result2 : " + result2 + " j2 : " + j2);
		//result2 : 10 j2 : 6   i2 : 5
		
		//Today Point
		//�ڹ��� ���� ��Ģ
		//*****[����]�� ��� ������ [int]�� ��ȯ �� ó�� �˴ϴ�.******
		//byte + byte => �����Ϸ��� int + int ��ȯ�ؼ� ����Ѵ� => 
		byte b = 100; //= -128 ~ +127  //���ͷ����� �����϶� Ÿ�Ծȿ� ���� ���� ���� ����ȯ���� ���� �����ڵ��� �׷��� �Ű� �Ⱦ�
		byte c = 1;
		//byte d = b + c;
		//byte d = (byte)(b + c); //�ս� ���� ���� 128�� ������ overflow�� -128 �� �����Ե�
		int d = b + c; //�̷����ϸ� �ս��� �߻����� ����
		System.out.println("d :" + d);
		
		//byte + short => �����Ϸ��� int + int �� �ؼ��Ѵ�
		//char + char  => �����Ϸ��� int + int �� �ؼ��Ѵ�
		//����ó����
		//point : �������꿡  int ���� ���� Ÿ����  int �� ��ȯ�ȴ�. (long �� ���� -int ���� ũ�ϱ� )
		//(byte, char, short ���� -> int)
		
		//byte + short => int + int
		//char + int => int  + int
		//int + lont => lont + long �� �ȴ�.   ū������ ��ȯ��.

		//����+ �Ǽ� >Ÿ��ũ��� ������� �Ǽ��� �̱��.
		long ll = 10000000000L;
		float ff = 1.2f;
		float fresult = ll + ff;
		System.out.println(fresult);
		
		float num2 = 10.45f;
		int num3 = 20;
		//num2 + num3
		//float + int >> float + float
		
		//float result5 = num2 + num3; //������: ����� ��ȯ�� ������ؼ� �ּ�ó��
		//System.out.println(result5);
		
		int result5 = (int)(num2 + num3);
		System.out.println("�������� ��� :" + result5);
		
		char c2 = '!'; //char �� ����Ÿ���̴�. �����̱��ص�    
		char c3 = '!';
		
		//char result6 = c2 + c3;    �������� ������ int�� ���Ǳ⶧����
		int result6 = c2 + c3; //int + int
		System.out.println("result6 : " + result6);
		System.out.println((char)result6); //66�̶�� ������ ���� �ƽ�Ű �ڵ�ǥ���ڷ� ���� > B ������
		
		
		
		
		
		
		//���
		//�߼ұ���� ���蹮�� (������ ���) >> �����ϸ� �����(�ﰢ��)
		
		int sum = 0; //(���������� �׷��� �ʱ�ȭ��)
		//int j= 100; ���� j ���� ���� �Ұ���
		for(int j = 1 ; j <= 100 ; j++) {
			//System.out.println("j : " + j);
			if(j%2 == 0) {
				//System.out.println(j);
				//sum = sum + j;
				sum+=j; //���Կ�����
		}
}
		//System.out.println(j);  for���� ����ɶ� �����ǰ� for���� ������ ����� 
		System.out.println(sum);	
			
		
		//== ������ (���� ���ϴ¿�����)
		if(10 == 10.0f) {
			System.out.println("True");
		}else {
			System.out.println("False");
		}
	
		// ! ���� ������
		if('A' != 65) { //�����ʴ�?
			System.out.println("�� �����ʾ�");
		}else {
			System.out.println("�� ���� ���̾�"); //
		}
	
		//�ϱ����� (Today Point)!!!!
		//���� ������
		int p = 10;
		int k = -10;
		int result8 = (p == k) ?  p : k;   //p�ϰ� k�ϰ� ����? ����ǥ �� ���ǽ��� Ʈ���� �ݷоհ� ���ϰ� �����̸� �ݷеڸ� ���Ѵ�
		System.out.println("result8 :" + result8);
		
		//���� �����ڴ� ��� if�� ���ɿ��� ū ���̴� ������ �ٵ� ������ ª�Ƽ� ���� Ȱ���
		if(p == k) {
			result8 = p;
		}else {
			result8 = k;
		}
		System.out.println("result8 :" + result8);
		
		//����ǥ
		/*
		 ������
		 0 : False
		 1 : True
		 0�� 1�� �����Ҽ� �ִ� ������ 4����
		         OR       AND
		 
		 0 0     0         0
		 0 1     1         0
		 1 0     1         0
		 1 1     1         1
		 
		 Oracle (sql)
		 
		 select *
		 from emp
		 where empno=1000 and sal > 2000; //�׸��� (�Ѵ� ���� ����)�� ����(emp)���� ������(*) �����Ͷ�
		 
		 select *
		 from emp
		 where empno=1000 or sal > 2000;  //�Ǵ�, �̰ų�(���߿� �ϳ��� ���̾ ����)
		 
		 ������
		 |  or   ������
		 &  and  ������
		 
		 0 �� 1 �� ��ȯ�ؼ� bit ����
		 
		 || ������ (OR)
		 && ������ (AND)
		
		 */
		
		int x = 3;
		int y = 5;
		System.out.println("x|y :" + (x|y));  //7
		
		//��ǻ�ʹ� ������ 3,5 �� �������� ��ȯ�ؼ� bit �����Ѵ�. 
		//������ -> 2���� (0,1)
		//128 64 32 16 8 4 2 1 
		//  0  0  0  0 0 0 1 1  >> '������' 3�� '2����' 00000011
		//  0  0  0  0 0 1 0 1  >> '������' 5�� '2����' 00000101
		//OR0  0  0  0 0 1 1 1  >>  4 + 2 + 1 > 7
		//AND0 0  0  0 0 0 0 1  >>  1
		
		System.out.println("x&y :" + (x&y));  //1
		
	    //Today Point (&&(AND), ||(OR))
		//if(10 > 0 && -1 > 1 && 100 > 2 && 1 > -1...10��) {���๮} // && �϶��� �ΰ��� ���϶���
		//if(10 > 0 || -1 > 1 || 100 > 2 || 1 > -1...10��) {���๮} // || �϶��� �ΰ��� �ϳ�����
			
	}

}
