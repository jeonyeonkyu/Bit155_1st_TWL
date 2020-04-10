import kr.or.bit.Emp;

/*
 *1. 1~45까지의 난수를 발생시켜 6개의 배열에 담으세요
      (int)(Math.random()*45 + 1)
      lotto[0] = 44 , lotto[1] = 1 .... lotto[5] = 33
 *2. 배열에 담긴 6개의 배열값은 중복값이 나오면 안되요  (중복값 검증 :별찍기 비슷)
 *3. 배열에 있는 6개의 값은 낮은 순으로 정렬 시키세요  (정렬 : 자리바꿈)
 *4. 위 결과를 담고 있는 배열을 출력하세요 (화면 출력)

 추후에는 별도의 클래스 분리해서 Lotto.java ..... 
 현재 main 함수 안에서 사용 ....연습...

조별 1개 입니다
  
 */
public class Ex03_Array_lotto {

	public static void main(String[] args) {
		int[] lotto = new int[6];
		for (int i = 0; i < 6; i++) {
			lotto[i] = (int) (Math.random() * 45 + 1);
			for (int j = 0; j < i; j++) { // j < i (채워진 개수 만큼 비교)
				if (lotto[i] == lotto[j]) {
					i--; // point 같은 방의 값을 바꾸어여 한다
					break;
				}
			}
		}

		// 1. 6개 배열 모든 생성 .. 배열값을 비교하고 .. 중복값이 ... 6개를 만든다
		// 2. 배열값을 얻을때마다 기존 방에 있는 값들과 비교한다

		// 정렬하기 (6개의 배열 방이 만들어지고 나서)
		// swap
		for (int i = 0; i < lotto.length; i++) {
			for (int j = i + 1; j < lotto.length; j++) {
				if (lotto[i] > lotto[j]) {
					int temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}
			}
		}

		// 출력하기
		for (int i = 0; i < lotto.length; i++) {
			System.out.println(lotto[i]);

		}
		
		//Today Point ^^ 
		
		//개선된 for문, 향상된 for 문
		//JAVA: for(Type 변수명 : 배열 or Collection {실행구문}
		//C#  : for(Type 변수명 in 배열 or Collection {실행구문}
		//JavaScript : for(Type 변수명 in 배열 or Collection){실행구문}
		
		int[] arr3 = {5,6,7,8,9};
//		for(int i=0;i<arr3.length;i++) {
//			System.out.println(arr3[i]);
//		}
		for(int val : arr3) {      //아무 변수명을 넣으면 됨
			System.out.println(val); //5 ...9 까지 나온다.
			
		}
		System.out.println("-------String---------");
		//String 타입
		
		String[] strarr = {"A","B","C","D","FFFF"};
		
		for(String val : strarr) {
			System.out.println(val);
		}
		
		System.out.println("--------Emp----------");
		
		Emp[] list = {new Emp(1,"A"),new Emp(2,"B"),new Emp(3,"C")};
		//개선된 for 문을 사용해서 사번, 이름 출력
		
		System.out.println(list[0].getEname());
		list[0].setEname("AA");
		System.out.println(">");
		System.out.println(list[0].getEname());
		System.out.println("<");
		
		
		for(Emp e : list) {
			e.empInfoPrint();
		}
		
		for(int i= 0;i<list.length;i++) {
			list[i].empInfoPrint();
		}
		
		//모닝커피 퀴즈 (3분)   시간은 3분
		int[][] score3 = new int[][] {
			{11,12},
			{13,14},
			{15,16},
		};
		
		//개선된 for문을 사용해서 배열값 출력
		
//		for(int z : score3) {
//			for(int y : score[z].length) {
//				System.out.println();
//			}
//		}
		for(int[] col : score3) {
			for(int val : col) {
				System.out.println("값: "+ val);
			}
		}
		
		 

	}

}
