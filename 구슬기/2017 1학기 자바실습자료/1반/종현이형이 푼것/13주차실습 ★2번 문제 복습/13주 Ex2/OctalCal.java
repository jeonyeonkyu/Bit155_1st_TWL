
public class OctalCal extends Calculator {

	void transNumbers(String mNum1, String mNum2){
		
		iNum1 = Integer.parseInt(mNum1, 8);
		iNum2 = Integer.parseInt(mNum2, 8);
		
	}//오버라이딩

	
	
	void printResult(){
		String strResult = Integer.toOctalString(iResult);
		System.out.println(strResult);
	}

}
