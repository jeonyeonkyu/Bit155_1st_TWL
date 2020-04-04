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
			//throw : �����ڰ� ���Ƿ� ���� �߻����Ѽ� ������ ����ó���� �ϵ��� �ϴ� ���.
			throw new IOException("Install �� ���� �߻�"); //���ܰ�ü�� �����ϸ�ȴ�.
		}catch(Exception e) { //�θ�ϱ� �ڽ�Ÿ���� ���ܸ� �޴´�.
			System.out.println("���� �޽��� ���: "+e.getMessage());
		}finally {//������ ���� ��(���ܰ� �߻��ص� (o) ,�߻����� �ʾƵ�(x) �����Ѵ�.
			fileDelete();
			
			//�ڿ����� .... ��ȯ.... �Ѵ�.
		}
		
		System.out.println("Main End");
		//********************************
		//�Լ��� �������� :return �ִ� �ϴ��� finally ���� ������ ���� ���� �� ������. 
		//finally ������ �ڵ�� return �� �־, ���ܰ� �ֵ���� ������ �����Ѵ�.
		//********************************
		

	}

}
