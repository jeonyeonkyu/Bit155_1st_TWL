import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

import kr.or.bit.UserInfo;

public class Ex15_ObjectDataOutputStream {

	public static void main(String[] args) throws Exception {
		String filename = "UserData.txt"; //프로젝트 폴더밑에 만들겠다.
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		ObjectOutputStream out = null;
		 
		try {
			fos = new FileOutputStream(filename,true); // 파일이 없으면 만든다.
			bos = new BufferedOutputStream(fos); 
			
			//직렬화
			out = new ObjectOutputStream(bos);
			UserInfo u1 = new UserInfo("홍길동","super",500); //이게 완제품
			UserInfo u2 = new UserInfo("scott","tiger",50); //얘도 완제품
			
			//직렬화 작업(여기서 보내는것)
			out.writeObject(u1); //이게 알아서 분해해서 줄을 세워서 file에다가 write 하는 것. 
			out.writeObject(u2); 
			//파일에 Userinfo 객체 2개 write
			
			
			
		
		} catch (Exception e) {
		    System.out.println(e.getMessage());
			e.printStackTrace();
		
		}finally {
			try {
				bos.close();
				fos.close();
				out.close();
				System.out.println("파일 생성-> buffer -> 직렬화 -> 파일write");
			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}

	}

}
