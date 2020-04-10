import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

import kr.or.bit.UserInfo;

public class Ex15_ObjectDataOutputStream {

	public static void main(String[] args) throws Exception {
		String filename = "UserData.txt"; //������Ʈ �����ؿ� ����ڴ�.
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		ObjectOutputStream out = null;
		 
		try {
			fos = new FileOutputStream(filename,true); // ������ ������ �����.
			bos = new BufferedOutputStream(fos); 
			
			//����ȭ
			out = new ObjectOutputStream(bos);
			UserInfo u1 = new UserInfo("ȫ�浿","super",500); //�̰� ����ǰ
			UserInfo u2 = new UserInfo("scott","tiger",50); //�굵 ����ǰ
			
			//����ȭ �۾�(���⼭ �����°�)
			out.writeObject(u1); //�̰� �˾Ƽ� �����ؼ� ���� ������ file���ٰ� write �ϴ� ��. 
			out.writeObject(u2); 
			//���Ͽ� Userinfo ��ü 2�� write
			
			
			
		
		} catch (Exception e) {
		    System.out.println(e.getMessage());
			e.printStackTrace();
		
		}finally {
			try {
				bos.close();
				fos.close();
				out.close();
				System.out.println("���� ����-> buffer -> ����ȭ -> ����write");
			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}

	}

}
