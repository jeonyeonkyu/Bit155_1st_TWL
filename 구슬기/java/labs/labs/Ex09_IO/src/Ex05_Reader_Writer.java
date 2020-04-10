import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/*
 ���ݺ��ʹ� ���ڱ���� ������ ó���� �����ϴ�
 
 char[] ������ ����(String Ŭ���� ���������� ������ char[]����)
 
 �ѱ�1�� >> 2byte >> Stream ����δ� �Ұ���(�⺻������ Byte ũ���)
 �׷��� ��� 2byte ���븦 ����:
 reader    ,writer �߻� Ŭ���� 
 
 ��� File�̶�� 
 FileReader , FileWriter
 
 
 
 */
public class Ex05_Reader_Writer {
	public static void main(String[] args) {
		FileReader fr = null;
		FileWriter fw = null;
		try {
		fr = new FileReader("Ex01_Stream.java");	 //"Ex01_Stream.java" �긦 �о���̰ڴ�!
		fw = new FileWriter("copy_Stream.txt");  //������ �����Ұž�....
		 //"Ex01_Stream.java" �긦 �о "copy_Stream.txt" �� write�Ұž�
		int data = 0;
		while((data = fr.read()) !=-1) {
			
			//System.out.println((char)data); 
			//2byte �� �о �ѱ��� �� ���´�. int�ϱ� (char)�� ĳ��������
			fw.write(data); //data ���� read �ؼ� copy_Stream.txt Write �ϰڽ��ϴ�.
			//���Ϳ� ���鵵 char ���̶� �״�� ����ȴ�. 
			if(data != '\n' && data != '\r' && data != '\t'&& data != ' ') {
				fw.write(data);
				//��������(������ ũ�⸦ ����: ��������) �������� ���� ���ص��Ǵ°��϶�. 
				
				//�ٽ� �غ���
			}
		}
		System.out.println("file ó��");
		} catch (Exception e) {
		e.printStackTrace();
		
		}finally {
			try {
				fw.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
