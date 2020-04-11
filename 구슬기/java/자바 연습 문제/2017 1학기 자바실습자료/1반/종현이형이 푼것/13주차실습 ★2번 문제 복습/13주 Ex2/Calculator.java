
public class Calculator {
	int iNum1, iNum2, iResult = 0;
	
	void transNumbers(String mNum1, String mNum2){
		iNum1 = Integer.parseInt(mNum1);
		iNum2 = Integer.parseInt(mNum2);
	
	}
	
	void addNumbers(){
		
		iResult = iNum1 + iNum2;
	}
	
	void printResult(){
		System.out.println(iResult);
	}

}
