import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

//다른 이미지로 다시해보기!! 꼭 다시해보기!!!

public class Ex03_Stream_ImageCopy {
	public static void main(String[] args) {
		String orifile = "C:\\IOTemp\\1.jpg";
		String targetfile = "copy.jpg";
		//default 경로..프로젝트 폴더가  default 경로가 된다.
		//C:\Users\bit\Desktop\labs\Ex09_IO

		
		
		FileInputStream fs = null;
		FileOutputStream fo = null;

		try {
			fs = new FileInputStream(orifile);
			fo = new FileOutputStream(targetfile, false);

			int data = 0;
			while ((data = fs.read()) != -1) {
				fo.write(data); // data 값을 read 해서 targetfile write 작업
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
