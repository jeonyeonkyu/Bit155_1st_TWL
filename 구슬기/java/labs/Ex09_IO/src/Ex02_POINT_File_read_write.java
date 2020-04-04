import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
read ,write ��� File (�������� ����) >> 1.txt, data.txt
FileInputStream
FileOutputStream

 C:\\IOtemp\\a.txt\\Hello 
 
 */
public class Ex02_POINT_File_read_write {
	public static void main(String[] args) {
		/*
		try {
			//POINT : I/O �۾��� ��κ� ������ �÷����� ����� �ƴϴ�.
			//������� �ڿ��� ��ü��(��ȯ�۾�) ������� >> close() >>���������� �Ҹ��ڸ� ȣ���ϴ� ���)
			
			FileInputStream fs = new FileInputStream("C:\\IOTemp\\a.txt");
		//�� ����� �ѱ��� ���д´�. 
			int data = 0;
			while((data = fs.read()) != -1) {
				System.out.println("����(����) :" + data);
				//���ڰ�����..
				char c = (char)(data);
				System.out.println(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//����, ������ ������ ����Ǵ� ��
			fs.close();
		}
		*/
		
		FileInputStream fs =null;
		FileOutputStream fos = null;
		String path = "C:\\IOTemp\\a.txt";
		try {
			//POINT : I/O �۾��� ��κ� ������ �÷����� ����� �ƴϴ�.
			//������� �ڿ��� ��ü��(��ȯ�۾�) ������� >> close() >>���������� �Ҹ��ڸ� ȣ���ϴ� ���)
			
			 fs = new FileInputStream(path);
		//�� ����� �ѱ��� ���д´�. 
			 fos = new FileOutputStream("C:\\IOTemp\\new.txt",true);  
			 //write
			 //FileOutputStream ���� ��������� ������ ������
			 //���Ͽ� write �Ҷ� ������ �������� ������ [���ϻ����� �Ѵ�.]
			 
			 //new FileOutputStream("C:\\IOTemp\\new.txt",false);   false��  default �ɼ��̴�. 
			 //���� �����Ϳ� overwrite ��.   ��������� .
			 
			 //fos = new FileOutputStream("C:\\IOTemp\\new.txt",true);  
			 //���� ������ append  �̰� �����ȴ�.
			 
			 
			 
			int data = 0;
			while((data = fs.read()) != -1) {
//				System.out.println("����(����) :" + data);
//				//���ڰ�����..
//				char c = (char)(data);
//				System.out.println(c);
				fos.write(data);  //data ���� �о C:\\IOTemp\\new.txt ���⿡ ����.   read >>write
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {  //���ܰ� �߻��ϴ� �ƴϴ� �ڿ������Ϸ��� �ϴ°Ŵ�. 
			//����, ������ ������ ����Ǵ� ��
			
			try{
				fs.close(); //�ݾ��ֱ� 
				fos.close(); 
			
			}catch(IOException e) {
				e.printStackTrace();
			}
		
		}
		
		

	}

}
