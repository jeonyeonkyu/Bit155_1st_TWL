package Ppt7;

import java.util.Scanner;

public class Ppt7_1_Calculator {
	int result = 0;

	public void Cal() {
		Scanner sc = new Scanner(System.in);
		String[] Oper = { "+", "-", "*", "/" };
		String input = null;
		int oper = 5;
		int num1 = 0, num2 = 0;

		System.out.println("계산할 수식 입력(ex: 3 + 3) : ");
		input = sc.nextLine();

		String[] save = new String[input.length()];

		for (int q = 0; q < input.length(); q++) {
			save[q] = input.substring(q, q + 1);
		} // for 문 종료 / 숫자 , 연산자를 하나씩 배열에 저장 및 오류검출

		for (int i = 0; i < Oper.length; i++) {
			for (int w = 0; w < input.length(); w++) {
				if (Oper[i].equals(save[w])) {
					oper = i;
					num1 = Integer.parseInt(input.substring(0, 1));
					num2 = Integer.parseInt(input.substring(4, 5));

				}
			}
		}
		switch (Oper[oper]) {
		case "+":
			plus(num1, num2);
			break;
		case "-":
			minus(num1, num2);
			break;
		case "*":
			multiply(num1, num2);
			break;
		case "/":
			division(num1, num2);
			break;
		}

	}

	public void plus(int iNum1, int iNum2) {

		result = iNum1 + iNum2;
		System.out.println(iNum1 + " + " + iNum2 + " = " + result);
	}

	public void minus(int iNum1, int iNum2) {
		result = iNum1 - iNum2;
		System.out.println(iNum1 + " - " + iNum2 + " = " + result);
	}

	public void multiply(int iNum1, int iNum2) {
		result = iNum1 * iNum2;
		System.out.println(iNum1 + " * " + iNum2 + " = " + result);
	}

	public void division(int iNum1, int iNum2) {
		result = iNum1 / iNum2;
		System.out.println(iNum1 + " / " + iNum2 + " = " + result);
	}

}
