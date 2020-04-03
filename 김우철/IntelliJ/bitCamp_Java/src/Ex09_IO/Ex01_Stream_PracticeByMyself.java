package Ex09_IO;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;

public class Ex01_Stream_PracticeByMyself {

    public static void main(String[] args) {
        byte[] inSrc = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
        byte[] outSrc = null;
        byte[] temp = new byte[4];

        ByteArrayInputStream input = null;
        ByteArrayOutputStream output = null;

        input = new ByteArrayInputStream(inSrc);
        output = new ByteArrayOutputStream();
        System.out.println("input soruce: " + Arrays.toString(inSrc));

        try {
            while (input.available() > 0) {
                input.read(temp); //inSrc 배열값을 read 해서 temp 배열에 write까지
                output.write(temp); //temp 배열값을  output 스트림에
                System.out.println("before : " + output.size());
                outSrc = output.toByteArray(); //output 스트림에 있는 값을 배열로 변환 리턴
                System.out.println(outSrc.length);
                printArrays(temp, outSrc);

                //input.read(temp);
                // inSrc 배열값을 read 해서 temp 배열에 write까지
                //System.out.println(Arrays.toString(temp));
                // [0, 1, 2, 3]
                // [4, 5, 6, 7]
                // [8, 9, 6, 7]
                //  System.out.println("output source: "+Arrays.toString(outSrc));
            }

        } catch (Exception e) {
        }
    }

    static void printArrays(byte[] temp, byte[] outSrc) {
        System.out.println("temp : " + Arrays.toString(temp));
        System.out.println("output source: " + Arrays.toString(outSrc));
    }

}
