package calculator;

public class Calculator {

	Calculator() {
		System.out.println("=== 간단한 계산기 ===");
	}

	public void plus(int iNum1, int iNum2) {
		System.out.println(iNum1 + " + " + iNum2 + " = " + (iNum1 + iNum2));
	}

	public void minus(int iNum1, int iNum2) {
		System.out.println(iNum1 + " - " + iNum2 + " = " + (iNum1 - iNum2));
	}
	
	public void multiply(int iNum1, int iNum2) {
		System.out.println(iNum1 + " * " + iNum2 + " = " + (iNum1 * iNum2));
	}

	public void division(int iNum1, int iNum2) {
		if(iNum1 == 0 || iNum2 == 0) {
			System.out.println("0이 아닌 다른 수를 입력해주세요");
			return;
		}
		System.out.println(iNum1 + " / " + iNum2 + " = " + (iNum1 / iNum2));
	}
}
