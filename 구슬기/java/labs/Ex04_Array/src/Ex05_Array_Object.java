import kr.or.bit.Emp;

public class Ex05_Array_Object {

	public static void main(String[] args) {
		// 1.사원 3명을 만드세요 (단 배열을 사용하세요
		// 1000, "홍길동"
		// 2000, "김유신"
		// 3000, "유관순"

		// 1번 방법
		Emp[] emps = new Emp[3]; // 방만만든거고.
		emps[0] = new Emp(); // 객체 주소를 만들어준당
		emps[0].setEmpno(1000); // getter setter 함수로 값을 넣어준당
		emps[0].setEname("홍길동");

		emps[1] = new Emp();
		emps[1].setEmpno(2000);
		emps[1].setEname("김유신");

		emps[2] = new Emp();
		emps[2].setEmpno(3000);
		emps[2].setEname("유관순");

		// 사원 3명의 사번과 이름을 출력하세요.
		for (int i = 0; i < emps.length; i++) {
			emps[i].empInfoPrint();
		}

		// 2번 방법
		// int[] arr = new int[]{10,20,30}
		Emp[] emps2 = new Emp[] { new Emp(1000, "이씨"), new Emp(1000, "박씨") };
		for (int i = 0; i < emps2.length; i++) {
			emps2[i].empInfoPrint();

			// 3번 방법
			// int[] arr = {10,20}
			Emp[] emps3 = { new Emp(3, "김씨"), new Emp(4, "홍씨") };
			for (int i1 = 0; i1 < emps3.length; i1++) {
				emps3[i1].empInfoPrint();

			}

		}
	}
}
