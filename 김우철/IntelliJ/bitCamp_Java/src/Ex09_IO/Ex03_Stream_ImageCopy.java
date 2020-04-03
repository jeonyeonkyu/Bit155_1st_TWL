package Ex09_IO;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Ex03_Stream_ImageCopy {
    public static void main(String[] args) {
        String orifile = "C:\\Temp\\1.jpg";
        String targetfile = "copy.jpg";
        //default 경로 ... 프로젝트 폴더가 default 경로
        //D:\bit155\JAVA\Labs\Ex09_IO\copy.jpg
        FileInputStream fs = null;
        FileOutputStream fo = null;

        try {
            fs = new FileInputStream(orifile);
            fo = new FileOutputStream(targetfile, false);

            int data = 0;
            while ((data = fs.read()) != -1) {
                fo.write(data); //data 값을 read 해서 targetfile write 작업
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
