package ���_�����ϴ¼�_����;
import java.util.Scanner;

public class �⺻_���� {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("==����==");
		Scanner sc = new Scanner(System.in);
		Process PC = new Process();
		while(true){
				System.out.println("��� �� ���� �Է� (Ex 3 + 3)");
				String str = sc.nextLine();
				// split �� ����  �������� ����, ���ڿ� �ڸ���
				// �⺻ ����
				String[] strArr = str.split(" ");
				
//�׽�Ʈ				for(int i= 0 ; i<strArr.length ; i++){
//					System.out.println(strArr[i]);
//				}
				// equals�� ���ڿ� ��ü ��, ==�� ������ �ּ� ��
				// �⺻ ����
				int num1= Integer.parseInt(strArr[0]);
				int num2= Integer.parseInt(strArr[2]);
				if(strArr[1].equals("+")){
					//Integer Ŭ���� ��� Integer.paraseInt(���ڿ�) ���ڿ� int ��ȯ
					System.out.println(str +
							" = " + PC.plus(num1,num2));
				}else if(strArr[1].equals("-")){
					System.out.println(str +
							" = " + PC.minus(num1,num2));
				}else if(strArr[1].equals("*")){
					System.out.println(str +
							" = " + PC.multiply(num1,num2));
				}else if(strArr[1].equals("/")){
					System.out.println(str +
							" = " + PC.division(num1,num2));
				}else{
					break;
				}
		}
				
		
//	System.out.println(PC.plus(a,b));		
				
	}
}
