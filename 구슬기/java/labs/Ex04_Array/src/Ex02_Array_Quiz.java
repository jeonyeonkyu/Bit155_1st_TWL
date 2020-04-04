import java.util.Arrays;

public class Ex02_Array_Quiz {

	public static void main(String[] args) {
		// 수학과 학생들의 기말고사 시험점수
		int[] score = new int[] { 79, 88, 97, 54, 56, 95 };
		int max = score[0]; // max >> 79
		int min = score[0]; // min >> 79

		/*
		 * 제어문을 사용해서 max라는 변수에 시험점수 최대값을 , min 변수에 시험점수 최소값을 넣으세요. 출력되는 결과는: max = 97,
		 * min = 54 단 조건은 for문을 한번만 사용하십시오.(max , min 하나의 for)
		 * 
		 */

		for (int i = 0; i < score.length; i++) {
			if (min > score[i]) {
				min = score[i];
			}
			if (max < score[i]) {
				max = score[i];

			}
		}
		System.out.printf("min%d, max%d", min, max);

		for (int i = 0; i < score.length; i++) {
			// if(score[i] > max){max = score[i];}
			// if(score[i] < max){min = score[i];}
			max = (score[i] > max) ? score[i] : max;
			min = (score[i] < max) ? score[i] : min;
		}
		System.out.println();

		int[] number = new int[10];
		// 10개방의 값을 1~10까지 초기화하세요.

		for (int i = 0; i < number.length; i++) {
			number[i] = i + 1;
		}

		for (int i = 0; i < number.length; i++) {
			System.out.println(number[i]);
		}

		// 어느 학생의 기말고사 시험점수가 나왔음 (5과목)
		int sum = 0;
		float average = 0f;
		int[] jumsu = { 100, 55, 90, 60, 78 };
		/*
		 * 1. 총과목수 2. 과목의 합 3. 과목의 평균 단)2,3 문제는 하나의 for 문으로 해결하세요
		 */
		for (int i = 0; i < jumsu.length; i++) {
			sum += jumsu[i];
			// average = sum/ (float)jumsu.length;
			// 어느 시점에 평균(모든 과목의 누적 합)
			if (i == jumsu.length - 1) {
				average = sum / (float) jumsu.length; // 이렇게 하면 i가 배열의 갯수가 되었을때 그때 한번만 구한다.
			}
		}
		System.out.println("총과목수: " + jumsu.length + "\t과목의 합: " + sum + "\t과목의 평균: " + average);

		/*
		 1.1~45 까지의 난수를 발생시켜 6개의 배열에 담으세요
		 2.배열에 담긴 6개의 배열값은 중복값이 나오면 안되요 (중복값 검증: 별찍기 비슷)
		 3.배열에 있는 6개의 값은 낮은 순으로 정렬 시키세요 (정렬:자리바꿈)
		 4.위 결과를 담고 있는 배열을 출력하세요(화면 출력)
		 
		 추후에는 별도의 클래스 분리해서 Lotto.java...
		 현재 main 함수 안에서 사용...연습
		 */
		//이건 내가푼거
	
		int[] lotto = new int[6];
		int tmp = 0;
		
		for (int i = 0; i < 6; i++) {
			lotto[i] = (int) (Math.random() * 45 + 1);
		}
//		for(int i =0;i<6; i++) {
//			for(int j=0;j<6;j++) {
//				if(lotto[i] == lotto[j]) {
//					lotto[i]= i+1
//							;
//				}
//			}
//		}
		
		//작은것부터 큰거까지 순서대로 정렬.
		for(int i = 0;i<lotto.length;i++) { 
			for(int jk = 0;jk<lotto.length;jk++) {
				if(lotto[i]<lotto[jk]) {
					 tmp = lotto[i];
					lotto[i] = lotto[jk];
					lotto[jk]=tmp;
				}
			}
		}
		
		for(int i=0;i<lotto.length;i++) {
			System.out.print(lotto[i]+" ");
		}
		
		
	}

}
