import java.util.Scanner;

public class Ex09_Statement {

	public static void main(String[] args) {
		System.out.println("�Է�");
		/*Scanner sc = new Scanner(System.in);
		
		if(sc.hasNextInt()) { //�ǹ� (true, false)
			System.out.println("���� �Է�");			
		}else {
			System.out.println("������ �ƴϳ� �ٽ� �Է�");
		}

		 //�ϱ����� (�� �ϱ� �׽�Ʈ) ���	
		 //���ǹ� : if ���� (3����) , switch(){case : break;} 
		 //�ݺ��� : for(�ݺ�Ƚ�� ��Ȯ), while(true, false), do~while(){}
		 //�б⹮ : break(��Ż��), continue(�Ʒ� ���� skip)
		int count=0;  //�ϳ��϶� �߰�ȣ �������������� ������ �پ���������
		//if(count > 1) System.out.println("true");
		if(count >1) {
			System.out.println("true");
		}
		//2��°
		if(count > 1 ) {			
		}else {
			
		}
		//3��°
		if(count >=90) {
		}else if() {
			
		}else {
			
		}
		
	*/
		
		char data='A';
		switch(data) {
		case 'A' : System.out.println("���ں�");
		     break; //switch Ż��
		default : System.out.println("������ ��� ��");     	     
		}
		
		
		//�ݺ���
		//1~100������ ���� sum �̶�� ������ ��Ƽ� ����ϼ���
		
		int sum =0;
		
		for(int i = 1 ; i <= 100 ; i++) {
			sum+= i;
		}
		System.out.println("1~100 : "+ sum);
		
		//for���� ����ؼ� 1~10������ Ȧ���� ���� ���ϼ���
		//�� for�� �� ��� (if, swich ������)
		
		int sum2 = 0 ;
		for(int j = 1 ; j <=10 ; j += 2) { 
			sum2 += j ;
			
		}
		System.out.println(sum2);
		
		//1~100������ ��
		//¦���� ���� ���ϼ��� (if ��)
		
		int sum3 = 0; //main�� �������ִ� ��������
		for(int i = 1 ; i <=100 ; i += 2) { 
			if(i %2 != 0) {
				sum3 += i ;
			}
			
		}
		
		System.out.println(sum3);
		
		
		//�Ի���� (�ʼ�)
		//������ ����ϱ�( ��ø for��)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//2�� -9�� 
		//1~9 ���� * ���� ����
		
		for(int i = 2 ; i <=9 ; i++) {
			for(int j = 1 ; j <=9 ; j++) {
				//System.out.println("i : "+ i + "*" + j + "=" + i*j);
				System.out.printf("[%d]*[%d]=[%d]\t", i,j,i*j);
			}
			System.out.println();//�̷��� �ؾ� ���ĵǾ� ���´�.
		}
					
		//��ø for�� �����ϱ� (�����)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		System.out.println();
		//Today Point : break(Ż��) , continue(��ŵ skip > �Ʒ������� )
		for(int i = 2 ; i <=9 ; i++) {
			for(int j = 1 ; j <=9 ; j++) {
				if(i ==j) {
					break; //���� for �� Ż��
				}
				//System.out.printf("[%d]*[%d]=[%d]\t", i,j,i*j); �̷��� ���ڰ�������
				System.out.printf("%s","*");  //�̷��� ������� ����
			}
			System.out.println();
		}
		
		
		for(int i = 2 ; i <=9 ; i++) {
			for(int j = 1 ; j <=9 ; j++) {
				if(i ==j) { //if(i ==j) continue; {�߰�ȣ �� ��������}
					continue; //�Ʒ� �ִ� ������ skip �ϼ���  	[[[[System.out.printf("%s","*");  //�̷��� ������� ���� ]]]�� ��ŵ��
				}
				System.out.printf("[%d]*[%d]=[%d]\t", i,j,i*j);//�̷��� ���ڰ�������
				//System.out.printf("%s","*");  //�̷��� ������� ����
			}
			System.out.println();
		}
		
		for(int i = 2 ; i <= 9 ; i++) {
			for(int j =1 ; j < i ; j++) {// j<=9 //����� �޸����̳� �����忡 �׷�����
				System.out.print("*");
			}
			System.out.println();
		}
		
		for(int i = 100 ; i >=0 ; i --) { //����
			System.out.println(i);  
		}
		//���赵 �ȿ� ���� �帧�� �����ϱ⶧���� ���� ��� �ʿ��� 
		
		//�Ǻ���ġ����   ��ó�� �ܰ� ���� ,�ִ�����, �ִ�����, �ϳ����� ž
		int a = 0, b =1 ,c = 0;
		for(int i = 0 ; i < 10 ; i++) {
			a =b;
			b =c;
			c = a + b;
			System.out.println(""+c);
		}
		
		
		
		
	}

}
