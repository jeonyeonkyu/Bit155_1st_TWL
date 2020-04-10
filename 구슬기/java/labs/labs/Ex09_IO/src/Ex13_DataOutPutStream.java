import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
   ���� ��Ʈ�� -���������� ���δٱ⺸�ٴ� �ٸ� �ֵ��� �������ִ� ���� .ex)���۽�Ʈ��
   DataOutPutStream , DataInPutStream
   Java 8���� �⺻Ÿ��(Ÿ�̺��� write,read) �Ҽ� �ִ�.
   �� ������ �ڱ�鳢���� .. output���� ���� input���θ� �о���ϼ��ִ�.
   txt : 100,30,80,60 >>split >> convert(�갡����?) >> ���� ...  �̷��� �ֹι�ȣ�� ����ϱ��߾���    
   
 */


public class Ex13_DataOutPutStream {
	public static void main(String[] args) {
		int[] score = {100,60,55,94,23};
		FileOutputStream fos =null;
		DataOutputStream dos = null;
		try {
			fos = new FileOutputStream("score.txt"); //�̻��븦 ���ؼ� �����͸� ������ ���������� ��ȯ��Ų���� //������ ������. //��������ǲ��Ʈ���� ���ؼ��� ���� �� �ִ�.
			dos = new DataOutputStream(fos);
			for(int i = 0;i<score.length; i++) {
				dos.writeInt(score[i]);  //������ write >> read DataInputStream
				//dos.writeUTF(str);//web �ѱ�ó���ϴ� ���   utf�� 2byte�̴�.   //FileReaderWriter�� �ᵵ�ȴ�  IO�� �̷������� ��ġ�� �κ��� ����.
			}
		}catch (Exception e) {
		System.out.println(e.getMessage());
		}finally {
			
			try {
				dos.close();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
