package calculator;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Calculator calcuator = new Calculator();

		while (true) {

			System.out.println("����� ������ �Է��ϼ��� ex)3 + 3");
			
			String str = sc.nextLine();
			String[] arr = str.split(" ");
			int iNum1 = Integer.parseInt(arr[0]);
			int iNum2 = Integer.parseInt(arr[2]);
			String key = arr[1];
			
			if (key.equals("+")) {
				calcuator.plus(iNum1, iNum2);
			} else if (key.equals("-")) {
				calcuator.minus(iNum1, iNum2);
			} else if (key.equals("*")) {
				calcuator.multiply(iNum1, iNum2);
			} else if (key.equals("/")) {
				calcuator.division(iNum1, iNum2);
			}
			//java.lang.ArrayIndexOutOfBoundsException �ߴ°� ���߿� �����ϰ���
		}
	}
}