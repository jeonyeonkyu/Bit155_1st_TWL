import java.util.HashMap;
import java.util.Scanner;

public class Ex12_HashMap {
	public static void main(String[] args) {
		//일상 생활에서 (회원가입 -> 로그인 -> id,pwd   id는 중복값이 있으면 안되고, pwd는 중복 있어도 상관없다
		HashMap loginmap = new HashMap();
		loginmap.put("kim", "kim1004");
		loginmap.put("scott", "tiger");
		loginmap.put("lee", "kim1004");
		
		//우리 시스템 가입된 회원 정보(id, pwd)
		//id(o), pwd(o)  회원(환영하면 된다)
		//id(o), pwd(x)  실패(비밀번호 입력)
		
		//id(x), pwd(o)  ...
		//id(x), pwd(x)  ... 이거 두개는 별 볼일 없어서 하나로 퉁쳐도 된다.
		
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.println("ID , PWD 입력해 주세요");
			System.out.println("ID");
			String id = sc.nextLine().trim().toLowerCase(); //공백제거하고 대소문자..? //toLowerCase 대소문자 상관없이
			System.out.println("PWD");
			String pwd = sc.nextLine().trim();
			
			if(!loginmap.containsKey(id)) {
				System.out.println("ID 틀려요... 재입력 하세요");
			}else {
				//ID(o)
				//비번만 검증하면된다.  위에서 아이디는 검증된거임
				if(loginmap.get(id).equals(pwd)) {//get 은 value 값을 가져온다.
					System.out.println("회원님 방가방가^^");
					break; //while 탈출
				}else {
					System.out.println("비번을 확인하세요");
				}
			}
					
					
			
		}
		
	}

}
