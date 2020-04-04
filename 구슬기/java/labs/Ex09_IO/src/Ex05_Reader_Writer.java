import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/*
 지금부터는 문자기반의 데이터 처리가 가능하다
 
 char[] 가지고 놀자(String 클래스 내부적으로 데이터 char[]관리)
 
 한글1자 >> 2byte >> Stream 빨대로는 불가능(기본적으로 Byte 크기라서)
 그래서 통로 2byte 빨대를 만듦:
 reader    ,writer 추상 클래스 
 
 대상 File이라면 
 FileReader , FileWriter
 
 
 
 */
public class Ex05_Reader_Writer {
	public static void main(String[] args) {
		FileReader fr = null;
		FileWriter fw = null;
		try {
		fr = new FileReader("Ex01_Stream.java");	 //"Ex01_Stream.java" 얘를 읽어들이겠다!
		fw = new FileWriter("copy_Stream.txt");  //파이을 생성할거야....
		 //"Ex01_Stream.java" 얘를 읽어서 "copy_Stream.txt" 에 write할거야
		int data = 0;
		while((data = fr.read()) !=-1) {
			
			//System.out.println((char)data); 
			//2byte 씩 읽어서 한글이 잘 나온다. int니까 (char)로 캐스팅해줌
			fw.write(data); //data 값을 read 해서 copy_Stream.txt Write 하겠습니다.
			//엔터와 공백도 char 값이라서 그대로 복사된다. 
			if(data != '\n' && data != '\r' && data != '\t'&& data != ' ') {
				fw.write(data);
				//압축파일(파일의 크기를 감소: 배포버전) 유지보수 굳이 안해도되는것일때. 
				
				//다시 해보셈
			}
		}
		System.out.println("file 처리");
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
