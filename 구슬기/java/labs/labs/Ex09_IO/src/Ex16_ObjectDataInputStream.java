import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.ObjectInputStream;

import kr.or.bit.UserInfo;

//userData.txt ����ȭ�� ��ü�� 2��
//��ü�� read �����·� ����(������ȭ)
public class Ex16_ObjectDataInputStream {

	public static void main(String[] args) {
		String filename = "UserData.txt";

		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ObjectInputStream in = null; // ��� ���� ��Ʈ�� �ٴѴ�

		try {
			fis = new FileInputStream(filename);
			bis = new BufferedInputStream(fis);
			in = new ObjectInputStream(bis); // �䷸�� ��Ʈ .. //������ �ڵ尡 ������ȭ�� �Ѵ�.
			
			
			//��ü�� ����� �ƴ°��
			//UserInfo r1 = (UserInfo) in.readObject();
			//UserInfo r2 = (UserInfo) in.readObject();
			//System.out.println(r1.toString());
			//System.out.println(r2.toString());
			
			
			//��ü�� ����� �𸣴°��
			
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
