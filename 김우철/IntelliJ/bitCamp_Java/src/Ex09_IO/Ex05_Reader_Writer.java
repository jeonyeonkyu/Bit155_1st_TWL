package Ex09_IO;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/*
문자기반의 데이터 처리
char[] 가지고 놀자  (String 클래스 내부적으로 데이터 char[] 관리)

한글 1자 >> 2byte >> Stream 빨대 불가능(byte)
통로 2byte 빨대 :
reader  , writer 추상 클래스

대상 File
FileReader , FileWriter
*/
public class Ex05_Reader_Writer {
    public static void main(String[] args) {
        FileReader fr = null;
        FileWriter fw = null;
        try {
            fr = new FileReader("Ex01_Stream.java"); //Ex01_Stream.java read 하겠다
            fw = new FileWriter("copy_Stream.txt"); //파일 생성 ...
            //Ex01_Stream.java read 해서 ...  copy_Stream.txt 에 write
            int data = 0;
            while((data = fr.read()) != -1) {
                // System.out.println((char)data);

                //fw.write(data); //data 값을 read  copy_Stream.txt write 하겠습니다
                if(data != '\n' && data != '\r' && data != '\t' && data != ' ') {
                    fw.write(data);
                    //압축파일 (파일의 크기를 감소 : 배포 버전)
                }

            }

        }catch (Exception e) {
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
