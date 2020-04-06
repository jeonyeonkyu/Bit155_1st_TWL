
public abstract class GameConnectHelper {//네가지 메소드로 게임 커넥트의 동작을 나누고 그것을 추상 메소드로 선언한다.
	// 선언한 이후에 아래의 코드에서 각각의 메소드를 구현한다.
	protected abstract String doSecurity(String string);//구체 적인 정보는 하위 클래스에서 구현
	protected abstract boolean authentication(String id, String password);//하위 클래스가 재정의 해야하기에 private선언 안됨.
	protected abstract int authorization(String userName);//protected로선언해야 같은패키지에서 접근가능
	protected abstract String connection(String info);
	//템플릿 메서드
	
	public String requestConnection(String encodedInfo) {//이 메소드를 public으로 선언해야 
		//main과 게임 커넷트 클래스 두개가 서로 다른 패키지에 있어도 호출이 가능하다
		String decodedInfo = doSecurity(encodedInfo);
		//반환된것을 가지고 아이디, 암호를 할당한다.
		String id = "aaa";
		String password = "bbb";
		
		if(!authentication(id, password)) {
			throw new Error("암호 불일치");
		}
		String userName = "userName";
		int i = authorization(userName);
		switch(i) {
		case -1:
			throw new Error("셧다운");
		case 0://게임매니저
			System.out.println("");
				break;
		case 1://유료 회원
			System.out.println("");
				break;
		case 2://무료회원
			System.out.println("");
				break;
		case 3://권한 없음
			System.out.println("");
			   break;
		default://기타 상황
			break;
		}
		return connection(decodedInfo);
	}

}
