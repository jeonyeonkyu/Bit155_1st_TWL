import java.util.Scanner;

public class ex3{
	public static void main(String args[]){
		Scanner sc=new Scanner(System.in);
	
	int number[]=new int[10];
	for(int i=0;i<number.length;i++)
	{
		System.out.print((i+1)+"��° �����Է�(0~9):");	
		int val=sc.nextInt();
		number[i]=val;
	}
	
	for(int i=0;i<number.length-1;i++)
	{
		for(int j=0;j<number.length-1-i;j++)
		{
			if(number[j]<number[j+1])
			{
				int tmp=number[j];
				number[j]=number[j+1];
				number[j+1]=tmp;
			}
		}
	}

	System.out.print("�����Ͽ� ���� �� �ִ� ���� ū ���ڴ�:");	
	
	for(int i=0;i<number.length;i++)
	{
		System.out.print(number[i]);	
	}
}
}
