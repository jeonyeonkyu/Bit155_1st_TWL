import java.util.Scanner;

public class ex2{
	public static void main(String args[]){
		Scanner sc=new Scanner(System.in);

	

		int number[]={10,20,32,43,54,65,76,87,98,109};

	Boolean check=false;
	System.out.println("�迭={10,20,32,43,54,65,76,87,98,109}");

	System.out.println("Ž���� ���� �Է� �Ͻÿ�.:");
		int val=sc.nextInt();

	for(int i=0;i<number.length;i++)
	{
		if(val==number[i])
		{
		check=true;
		System.out.println("Ž���� ���� �迭��"+(i+1)+"��°�� �ֽ��ϴ�.");
		break;
		}
		
	}
		if(check==false)
		System.out.println("Ž���� ���� �迭�� �����ϴ�.");
	}
}