package Ex09_IO;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;

/*
I/O
추상클래스
InputStream , OutPutStream  (Byte)
두개의 클래스를 상속(재정의) 하는 클래스를 통해 입출력 작업

대상에 따라서
1. Memory : ByteArrayIn ...  /   ByteArrayOut ...
2. File(^^) : FileInput ...  /   FileOutput ...

*/
public class Ex01_Stream {
    public static void main(String[] args) throws IOException {
        //byte (-128 ~ 127) 정수가 저장 타입
        byte[] inSrc = {0,1,2,3,4,5,6,7,8,9};
        byte[] outSrc = null; //현재는 메모리를 가지고 있지 않아요

        //내가 데이터를 read , write 하는 대상을  Memory
        ByteArrayInputStream input = null;
        ByteArrayOutputStream output = null;

        input = new ByteArrayInputStream(inSrc); //read
        //생성자를 통해서 inSrc 배열의 값을 read 할 건지
        output = new ByteArrayOutputStream(); //write

        System.out.println("outSrc before : " + Arrays.toString(outSrc));

        //공식같은 로직 (암기)
        int data = 0;
        while((data = input.read()) != -1){  //더 이상 read 할  Data 가 없다면  -1
            //System.out.println("data : " + data);
            //System.out.println("input.read()" + input.read());
            //read() 함수는 내부적으로  next() 기능 포함
            output.write(data);
            //자시자신에게 data 변수의 값을 read 해서 write
            //write 대상이  output (ByteArrayOutputStream) 자신의 통로에 read 가지고 있다
        }
        outSrc = output.toByteArray();
        // toByteArray >> 자기가 가지고 있는 값을 배열로 만들어서 그 주소값을  outSrc 에게 할당
        System.out.println("outSrc : " + Arrays.toString(outSrc));

    }

}
