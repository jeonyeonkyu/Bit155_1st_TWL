import java.util.Scanner;

public class ex1{
	public static void main(String args[]){
		Scanner sc=new Scanner(System.in);

	System.out.print("@@@ ù��° �迭�� ũ�⸦ �Է��Ͻÿ�");
	int size1=sc.nextInt();
	int first[]=new int[size1];

		for(int i=0;i<size1;i++)
		{
			System.out.print((i+1)+"��° �迭�� ���� �Է��Ͻÿ�.");
			int val=sc.nextInt();
			first[i]=val;
		}

	System.out.print("@@@ �ι�° �迭�� ũ�⸦ �Է��Ͻÿ�");
	int size2=sc.nextInt();
	int second[]=new int[size2];

		for(int i=0;i<size2;i++)
		{
			System.out.print((i+1)+"��° �迭�� ���� �Է��Ͻÿ�.");
		int val=sc.nextInt();
		second[i]=val;
		}

	System.out.print("ù��° �迭:");
		for(int i=0;i<size1;i++)
		{
			System.out.print(first[i]+" ");

		}
	System.out.println();
	System.out.print("�ι�° �迭:");
		for(int i=0;i<size2;i++)
		{
			System.out.print(second[i]+" ");

		}
	System.out.println();
	System.out.print("����° �迭:");
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