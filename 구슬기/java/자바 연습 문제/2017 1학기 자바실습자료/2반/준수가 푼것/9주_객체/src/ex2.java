import java.util.Scanner;

public class ex2{
	public static void main(String args[]){
		Scanner sc=new Scanner(System.in);

	

		int number[]={10,20,32,43,54,65,76,87,98,109};

	Boolean check=false;
	System.out.println("배열={10,20,32,43,54,65,76,87,98,109}");

	System.out.println("탐색할 값을 입력 하시오.:");
		int val=sc.nextInt();

	for(int i=0;i<number.length;i++)
	{
		if(val==number[i])
		{
		check=true;
		System.out.println("탐색할 값은 배열의"+(i+1)+"번째에 있습니다.");
		break;
		}
		
	}
		if(check==false)
		System.out.println("탐색할 값이 배열에 없습니다.");
	}
}