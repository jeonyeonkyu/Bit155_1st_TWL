import java.io.IOException;

public class Ex03_Exception_finally {
	static void startInstall() {
		System.out.println("INSTALL");
	}
	static void copyFiles() {
		System.out.println("COPY FILES");
	}
	static void fileDelete() {
		System.out.println("DELETE FILES");
	}

	
	public static void main(String[] args) {
		
		try {
			copyFiles();
			startInstall();
			//throw : 개바자가 임의로 문제 발생시켜서 강제로 예외처리를 하도록 하는 방법.
			throw new IOException("Install 중 문제 발생"); //예외객체를 생성하면된다.
		}catch(Exception e) { //부모니까 자식타입의 예외를 받는다.
			System.out.println("예외 메시지 출력: "+e.getMessage());
		}finally {//강제적 실행 블럭(예외가 발생해도 (o) ,발생하지 않아도(x) 실행한다.
			fileDelete();
			
			//자원해제 .... 반환.... 한다.
		}
		
		System.out.println("Main End");
		//********************************
		//함수의 강제종료 :return 있다 하더라도 finally 블럭은 무조건 강제 실행 후 끝난다. 
		//finally 블럭안의 코드는 return 이 있어도, 예외가 있든없든 무조건 실행한다.
		//********************************
		

	}

}
