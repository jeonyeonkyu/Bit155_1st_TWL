import java.util.Scanner;

public class AdditionProgram {
	boolean isRun = true;
	Scanner sc = new Scanner(System.in);
	
	Calculator cal;
	String[]  strInputs;

	void printInfo(){
		
		System.out.println("������ ��� ���� >> bin 1101 1111");
		System.out.println("������ ��� ���� >> oct 721 12");
		System.out.println("������ ��� ���� >> dec 912 19");
		System.out.println("�������� ��� ���� >> hex 928 ae1");
		System.out.println("���� ���� >> exit");
		
	}
	public void programStart() {
		// TODO Auto-generated method stub
		String strInput;
		System.out.println("=== ���� ���� ===");
		
		printInfo();
		while(isRun){
			System.out.print(">> ");
			strInput = sc.nextLine();
			strInputs = strInput.split(" ");
			
			if(strInput.startsWith("bin")){
				cal = new BinaryCal();
			}
			else if(strInput.startsWith("oct")){
				cal = new OctalCal();
			}
			else if (strInput.startsWith("dec")){
				cal = new Calculator();
			}
			else if( strInput.startsWith("hex")){
				cal = new HexadecimalCal();
			}
			else if (strInput.equals("exit")){
				programEnd();
			}
			else {
				System.out.println("�Է¿���. �ٽ� �Է��ϼ���");
				
			}
			
			if(strInputs.length == 3)
				procedures();
			
			
			
		}
		
	}
	
	void procedures(){
		
		cal.transNumbers(strInputs[1], strInputs[2] );
		cal.addNumbers();
		System.out.print("������� >>");
		cal.printResult();
		
	}
	void programEnd(){
		System.out.println("���α׷��� �����մϴ�.");
		System.out.println("=== ���� ���� ===");
		isRun = false;
	}
	
	
	

}
