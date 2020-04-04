
public class Ex02_Exception {

	public static void main(String[] args) {
		int num = 100;
		int result =0;
		
		System.out.println("Main Start");
		
		try {
			for(int i =0; i< 10 ;i ++) {
				result = num/(int)(Math.random() *10); //나오는 랜덤값의 범위는 0~9 //내가 테스트 할땐 에러없다가 팀원이 할때 에러가 나는것. 
				                                       //내가할때 안나오는 이유. 이상한 짓을 안해서. 예쁘게만 테스트 한다.
				System.out.println("result : "+ result + " i : "+ i);
			}
			
		}catch(ArithmeticException e) {//문제가 발생하면 그 예외에 맞는 객체가 자동 생성된다.  그리고 그 객체가 정보를 갖고있다. 여기선 산수 오류 객체가 생성되서 e가 정보를 갖는다.
		     //이게 가독성이 좋다.
			System.out.println("연산예외발생 [관리자에 이메일]");
			System.out.println(e.getMessage()); 
			
			e.printStackTrace();//java.lang.ArithmeticException: / by zero
			                    //Main End
			                    //at Ex02_Exception.main(Ex02_Exception.java:12)
			//문제가 발생되면 내부적으로
			//new ArithmeticException() >>객체에다가 정보를 담는 것  >> 이 객체의 주소를 e라는 변수가 갖는다. Exception이 부모고, 부모는 자식의 주소를 조건없이 받을 수 있다.
		
		}catch(NullPointerException e) {
			
			
		}catch(Exception e) {//나머지 발생하는 모든 예외는 내가 처리 할게 (다형성이라는 특성을 가지고 있다.)
			
		}
		System.out.println("Main End");

	}

}
