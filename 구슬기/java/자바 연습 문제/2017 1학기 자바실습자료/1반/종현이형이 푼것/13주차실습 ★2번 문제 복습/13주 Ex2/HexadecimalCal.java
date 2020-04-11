
public class HexadecimalCal extends Calculator {
	
	void transNumbers(String mNum1, String mNum2){
		
		iNum1 = Integer.parseInt(mNum1, 16);
		iNum2 = Integer.parseInt(mNum2, 16);
		
	}//오버라이딩
	

	
	void printResult(){
		String strResult = Integer.toHexString(iResult);
		System.out.println(strResult);
		
	}


}
