import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

//�ٸ� �̹����� �ٽ��غ���!! �� �ٽ��غ���!!!

public class Ex03_Stream_ImageCopy {
	public static void main(String[] args) {
		String orifile = "C:\\IOTemp\\1.jpg";
		String targetfile = "copy.jpg";
		//default ���..������Ʈ ������  default ��ΰ� �ȴ�.
		//C:\Users\bit\Desktop\labs\Ex09_IO

		
		
		FileInputStream fs = null;
		FileOutputStream fo = null;

		try {
			fs = new FileInputStream(orifile);
			fo = new FileOutputStream(targetfile, false);

			int data = 0;
			while ((data = fs.read()) != -1) {
				fo.write(data); // data ���� read �ؼ� targetfile write �۾�
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fs.close();
				fo.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}

	}

}
