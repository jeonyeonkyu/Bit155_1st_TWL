package Ex09_IO;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/*
File 처리 (DISK) read , write
한 Byte read , write
모아 모아서 한번 가져가서 read , write (버스 타고 한번에 가자)
버스 >> Buffer
File  read , write 중간 Buffer >> I/O

1. I/O 성능개선
2. Line 단위 (엔터)

독자적인 객체 생성 불가 (주클래스 의존)
*/
public class Ex04_Stream_Buffer {
    public static void main(String[] args) {
        FileOutputStream fos = null;
        BufferedOutputStream bos = null;
        try {
            fos = new FileOutputStream("data.txt"); //default : false : 파일 생성
            bos = new BufferedOutputStream(fos);

            for(int i = 0 ; i < 10 ; i++) {
                bos.write('A');
            }
            //Java Buffer 크기  > 8kbyte => 8192byte
            //1. buffer 안에 내용이 8k 채워지면 스스로 비우는 작업 (내부적으로 flush)
            //2. buffer 강제로 비우기 (flush 또는 close)
            //3. bos.close() 자원해제  >> close() >> 내부적으로 flush 호출

            //야 내려 ... data.txt 쓰는 작업 수행 (x)
            //버스 (65석)
            //bos.flush();
        }catch (Exception e) {

        }finally {
            try {
                bos.close(); //flush
                fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}