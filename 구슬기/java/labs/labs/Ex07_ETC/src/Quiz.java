import java.util.Scanner;

//주민번호 : 뒷번호 첫자리 : 1,3 남자 , 2,4 여자 라고 출력 ...(조건) 
//main 함수 Scanner  사용 주민번호 입력받고
//앞:6자리 뒷:7자리
//입력값 : 123456-1234567 (문자열) 
//1. 자리수 체크 (기능)함수 (14 ok) >>>> 어제한 index
//2. 뒷번호 첫번째 자리값 1~4까지의 값만 허용 기능함수 -> 벗어나면 다시 입력하게 함  >>>>if
//3. 뒷번호 첫번째 자리값을 가지고 1,3 남자 , 2,4 여자 출력 기능함수  >>>> if
//4. 성별까지 나오도록해
//3개의 함수 static 
//프로그램을 짤때 규칙을 찾는 습관을 가져야 좋다. 



public class Quiz {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String jumin = "", gender = "";

		System.out.println("주민번호를 입력하세요 (-를 포함해서 입력)");
		jumin = sc.nextLine();
		int position = jumin.indexOf("-");
		String juminh= jumin.substring(0,position);
		String juminb=jumin.substring(position+1);
		
		
		if(jumin.length() != 14 || juminh.length() !=6 || juminb.length()!=7) {
			System.out.println("다시 입력하세요");
			
		} else {
			char ch = jumin.charAt(7); // 주민뒷자리 첫글자
			if (ch == '1' || ch == '2' || ch == '3' || ch == '4') {
				if (ch == '1' || ch == '3') {
					gender = "남자입니다.";
				} else if (ch == '2' || ch == '4') {
					gender = "여자입니다.";
				}
			} else {
				System.out.println("잘못된 입력입니다. 다시 입력하셈");
			}
		}
		System.out.println(gender);
		
		
		


	}

}
