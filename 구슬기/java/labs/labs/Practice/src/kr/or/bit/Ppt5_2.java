package kr.or.bit;

import java.util.Arrays;

public class Ppt5_2 {
	int[] a = { 45, 20, 63, 2, 71, 38, 86, 99, 12, 54 };
	int max = a[0];
	int min = a[0];

	public void showA() {
		System.out.println("배열 aArray =" + Arrays.toString(a));
	}

	public void minA() {
		for (int i = 0; i < a.length; i++) {
			// max = (a[i] > max) ? a[i] : max ;
			min = (a[i] < min) ? a[i] : min;

		}
		System.out.println("최소값 : {" + min + "}");

	}

	public void maxA() {
		for (int i = 0; i < a.length; i++) {
			max = (a[i] > max) ? a[i] : max;
		}
		System.out.println("최대값 : {" + max + "}");
	}

	public void lineA() {
		for (int i = 0; i < a.length; i++) {
			for (int j = i + 1; j < a.length; j++) {
				if (a[i] > a[j]) {
					int temp = a[i];
					a[i] = a[j];
					a[j] = temp;

				}

			}
		}
		System.out.println("오름차순 정렬 : "+ Arrays.toString(a));
	}
}
