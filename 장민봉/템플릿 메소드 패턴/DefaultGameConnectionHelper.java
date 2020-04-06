
public class DefaultGameConnectionHelper extends GameConnectHelper {
//DefaultGameConnectionHelper클래스는 게임 커넷트의 동작이 여러 메소드로 나누어서 정의된 추상클래스
// GameConnectHelper를 상속받는다
	@Override
	protected String doSecurity(String string) {
		System.out.println("강화된 알고리즘을 이용한 디코드");
		return string;
	}

	@Override
	protected boolean authentication(String id, String password) {
		System.out.println("아이디/암호 확인 과정");
		// TODO Auto-generated method stub
		return true;//맞으면 true반환
	}

	@Override
	protected int authorization(String userName) {
		System.out.println("권한 확인");//게임 매니저가 접속 했을때 권한 확인
		//서버에서 유저의 나이를 알수있다.
		//나이와 시간을 확인 했는데 미성년자이면 10시가 지났다면 권한이 없는 것으로 한다.
		
		return 0;
	}

	@Override
	protected String connection(String info) {
		System.out.println("마지막 접속 단계");
		// TODO Auto-generated method stub
		return null;
	}

}
