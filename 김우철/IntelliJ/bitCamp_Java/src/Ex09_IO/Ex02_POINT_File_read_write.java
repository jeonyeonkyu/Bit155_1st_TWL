package Ex09_IO;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/*
read , write 대상 File (물리적인 파일) >> 1.txt , data.txt
FileInputStream
FileOutputSream

C:\\IOtemp\\a.txt\\HELLO

*/
public class Ex02_POINT_File_read_write {
    public static void main(String[] args) {
		/*
		try {
			//POINT : I/O 작업은 대부분 가비지 컬렉터의 대상이 아니다
			//명시적인 자원의 해제를 (반환 >> close() >> 내부적으로 소멸자 호출)
			FileInputStream fs = new FileInputStream("C:\\Temp\\a.txt");
			int data = 0;
			while((data = fs.read()) != -1) {
				System.out.println("정수(숫자) : " + data);
				//문자값으로 ...
				char c = (char)data;
				System.out.println(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//정상 , 비정상
			//fs.close();
		}
		*/
        FileInputStream fs = null;
        FileOutputStream fos = null;
        String path = "C:\\Temp\\a.txt";
        try {
            //POINT : I/O 작업은 대부분 가비지 컬렉터의 대상이 아니다
            //명시적인 자원의 해제를 (반환 >> close() >> 내부적으로 소멸자 호출)
            fs = new FileInputStream(path);
            fos = new FileOutputStream("C:\\Temp\\new.txt", true);
            //write
            //FileOutputStream 파일 생성기능을 가지고 있을까
            //파일에 write 할때 파일이 존재하지 않으면 [파일을 생성]
            //new FileOutputStream("C:\\Temp\\new.txt",false); default
            //기존 데이터 overwrite ...

            //fos = new FileOutputStream("C:\\Temp\\new.txt",true);
            //기존 데이터 append

            int data = 0;
            while ((data = fs.read()) != -1) {
                //System.out.println("정수(숫자) : " + data);
                //문자값으로 ...
                //char c = (char)data;
                //System.out.println(c);
                fos.write(data); //data 값을 read >> write C:\\Temp\\new.txt

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //정상 , 비정상
            try {
                fs.close();
                fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
