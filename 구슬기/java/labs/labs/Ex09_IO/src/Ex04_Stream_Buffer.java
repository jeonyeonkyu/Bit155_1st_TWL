import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
 File ó��(DISK) read , write
 ������ �� Byte��  read , write
 ��� ��Ƽ� �ѹ��� �������� read , write �ϴ� ���� ������ �����̴�! (����Ÿ�� �ѹ��� ����)
 ���� >> Buffer 
 File read, write �߰� Buffer >> I/O
 
 1.I/O ������ �Դٰ��� �ϴ°� �ƴ϶� �ѹ��� ����(Buffer)�� ì�ܼ� Ǯ����ڴ�! ...���ɰ���
 2.Line ����(����) �� �Ҽ��ִ�.  �ǰ� ���Ѱ���.. ��
 
 �������� ��ü���� �Ұ�( �� Ŭ������ ������)
 
 �ѱ��� ������ ǥ���Ұ��� 
 */
public class Ex04_Stream_Buffer {
	public static void main(String[] args) {
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		try {
			fos = new FileOutputStream("data.txt"); //default : false : ���� ����
			bos = new BufferedOutputStream(fos);
			
			for(int i = 0 ; i < 10 ; i++) {
				bos.write('A'); //������ �����¿��� ���Ͼƿ�ǲ��Ʈ�����ش�.
			}
			//Java Buffer ũ�� > 8kbyte => 8192byte �ڱ��� ����
			//1.buffer �ȿ� ������ 8kbyte �� �� �������� ������ ���� �۾��� �Ѵ�.(���������� flush(��������))
			//2.buffer ������ ���� ( flush �Ǵ� close)
			//3. bos.close() �ڿ������ϴ°�(���̻�Ƚ��~�ϰ� �ݱ�) >> close() >>���������� flush ȣ�� 
			
			//�� ���� ... data.txt ���� �۾� ���� (x)
			//���� (65��) �¼��� �������� ��� ���� ����. ���۸� ���� ����. �����ξ����ϴ°�. flush() or close()   �̴�.
			//bos.flush();
		}catch (Exception e) {
			
		}finally {
			try {
				bos.close(); //flush  //������ ������� �ݾ��ָ� �ȴ�.
				fos.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
			
		}
	}

}







