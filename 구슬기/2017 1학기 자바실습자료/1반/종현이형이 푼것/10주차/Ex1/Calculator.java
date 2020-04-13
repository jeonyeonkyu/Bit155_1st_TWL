
public class Calculator {

	int iNum1;
	int iNum2;

	public void sum(String iNum1){
		System.out.print("sum(\"8,14\"):");
		String iNum1arr[] = iNum1.split(",");
		this.iNum1=Integer.parseInt(iNum1arr[0]);
		this.iNum2=Integer.parseInt(iNum1arr[1]);
		System.out.println(this.iNum1+this.iNum2);
		
		
		}
	public void sum(int iNum1, int iNum2){
		System.out.print("sum(8,14):");
		System.out.println(iNum1+iNum2);
	}
	public void sum(int iNum1, String iNum2){
		System.out.print("sum(8,\"14\"):");
		this.iNum2 = Integer.parseInt(iNum2);
		System.out.println(iNum1+this.iNum2);
	}
	public void sum(String iNum1, int iNum2){
		System.out.print("sum(\"8\",14):");
		this.iNum1 = Integer.parseInt(iNum1);
		System.out.println(this.iNum1+iNum2);
	}
	public void sum(String iNum1, String iNum2){
		System.out.print("sum(\"8\",\"14\"):");
		this.iNum1 = Integer.parseInt(iNum1);
		this.iNum2 = Integer.parseInt(iNum2);
		System.out.println(this.iNum1+this.iNum2);
	}
}
