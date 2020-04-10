import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.ObjectInputStream;

import kr.or.bit.UserInfo;

//userData.txt 직렬화된 객체가 2개
//객체를 read 원상태로 복원(역직렬화)
public class Ex16_ObjectDataInputStream {

	public static void main(String[] args) {
		String filename = "UserData.txt";

		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ObjectInputStream in = null; // 얘네 세개 세트로 다닌당

		try {
			fis = new FileInputStream(filename);
			bis = new BufferedInputStream(fis);
			in = new ObjectInputStream(bis); // 요렇게 세트 .. //한줄의 코드가 역직렬화를 한다.
			
			
			//객체가 몇개인지 아는경우
			//UserInfo r1 = (UserInfo) in.readObject();
			//UserInfo r2 = (UserInfo) in.readObject();
			//System.out.println(r1.toString());
			//System.out.println(r2.toString());
			
			
			//객체가 몇개인지 모르는경우
			
			Object users = null;
			while((users = in.readObject()) !=null) {
				System.out.println(((UserInfo)users).toString());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				in.close();
				bis.close();
				fis.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

}
