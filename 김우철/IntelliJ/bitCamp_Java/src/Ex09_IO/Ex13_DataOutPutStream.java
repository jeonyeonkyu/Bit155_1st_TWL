import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
	보조 스트림
	DataOutPutStream , DataInPutStream
	Java 8가지 기본타입 (타입별로 write , read)
	단 조건 ... 자기들끼리만 ....
	txt : 100,30,80,60 >> split >> convert >> 연산 
*/
public class Ex13_DataOutPutStream {
	public static void main(String[] args) {
		int[] score = {100,60,55,94,23};
		FileOutputStream fos = null;
		DataOutputStream dos = null;
		
		try {
				fos = new FileOutputStream("score.txt");
				dos = new DataOutputStream(fos);
				for(int i = 0 ; i < score.length ; i++) {
					dos.writeInt(score[i]); //정수값 write >> read DataInputStream
					//dos.writeUTF(str);  web 한글처리 .... 
				}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				dos.close();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}

}









