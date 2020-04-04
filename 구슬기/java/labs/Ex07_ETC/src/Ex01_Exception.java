/*
 오류
 1.에러(error) : 네트워크 장애,메모리 ,하드웨어 같이 개발자 코드적으로 해결 불가능
 2.예외(Exception) : 개발자의 코드에 의해 발생.. 코드수정.. 해결가능
      문제 : 예외가 발생하면 프로그램은 강제 종료된다. 
 3.예외처리하는 방법: 문제가 생기는 코드를 수정하는게 아니고 [문제 발생시 비정상적인 종료를 막는 것]
                  추후에 문제가 생기는 코드는 수정해야함.. 
                  처음부터 안생기게 하면되지 않냐??  개발자도 모르는 거다.. 모든 상황을 대비하는것은 불가능..
          
                        
         try {
			//문제가 발생 할 수 있는 코드. 좀 불안한 코드. 혹시나~ 하는 그런 코드.
			//만약에 문제가 생기면...catch 에게 넘긴다. 
		
		}catch(Exception e) {
		
			//문제가 생기면 그 문제를 가져와서 문제를 파악한다.
			//관리자에게 e-mail 을 보낸다던가
			//로그파일 문제 원인 기록... 등을 할수있다.
			//강제종료는 막는다.
		
		}finally{
		
			//문제가 발생하던, 발생하지 않던 강제로 수행되어야 할 코드
			//DB연결 닫기
			
		}
 
 예외도 다형성이다..
 
 
 
 */
public class Ex01_Exception {
	public static void main(String[] args) {
		System.out.println("Main Start");
		try {
			
		System.out.println(0/0);//문제발생코드...
		
		}catch(Exception e) {//어떤 에러가 날지를 모르니 추상적으로 했다?
		
		System.out.println(e.getMessage());// 이메세지를 보고 잘못된건 내가 수정해야 한
		
		}
		System.out.println("Main End");
	}

}
