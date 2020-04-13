
public class BinaryCal extends Calculator {
	
	void transNumbers(String mNum1, String mNum2){
		iNum1 = Integer.parseInt(mNum1, 2);
		iNum2 = Integer.parseInt(mNum2, 2);
		
		
		
	}//오버라이딩
	

	
	void printResult(){
		String strResult = Integer.toBinaryString(iResult);
		System.out.println(strResult);
		
	}


}
