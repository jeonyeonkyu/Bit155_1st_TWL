package calculator;

public class Calculator {

	Calculator() {
		System.out.println("=== ������ ���� ===");
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
			System.out.println("0�� �ƴ� �ٸ� ���� �Է����ּ���");
			return;
		}
		System.out.println(iNum1 + " / " + iNum2 + " = " + (iNum1 / iNum2));
	}
}
