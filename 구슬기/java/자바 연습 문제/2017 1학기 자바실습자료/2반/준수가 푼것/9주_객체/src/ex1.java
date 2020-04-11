import java.util.Scanner;

public class ex1{
	public static void main(String args[]){
		Scanner sc=new Scanner(System.in);

	System.out.print("@@@ 첫번째 배열의 크기를 입력하시오");
	int size1=sc.nextInt();
	int first[]=new int[size1];

		for(int i=0;i<size1;i++)
		{
			System.out.print((i+1)+"번째 배열의 값을 입력하시오.");
			int val=sc.nextInt();
			first[i]=val;
		}

	System.out.print("@@@ 두번째 배열의 크기를 입력하시오");
	int size2=sc.nextInt();
	int second[]=new int[size2];

		for(int i=0;i<size2;i++)
		{
			System.out.print((i+1)+"번째 배열의 값을 입력하시오.");
		int val=sc.nextInt();
		second[i]=val;
		}

	System.out.print("첫번째 배열:");
		for(int i=0;i<size1;i++)
		{
			System.out.print(first[i]+" ");

		}
	System.out.println();
	System.out.print("두번째 배열:");
		for(int i=0;i<size2;i++)
		{
			System.out.print(second[i]+" ");

		}
	System.out.println();
	System.out.print("세번째 배열:");
		for(int i=0;i<size1;i++)
		{
			System.out.print(first[i]+" ");
		}
	
	for(int i=0;i<size2;i++)
	{
		System.out.print(second[i]+" ");
	}
}
}