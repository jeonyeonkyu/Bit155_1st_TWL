import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
   보조 스트림 -독자적으로 쓰인다기보다는 다른 애들을 보조해주는 역할 .ex)버퍼스트림
   DataOutPutStream , DataInPutStream
   Java 8가지 기본타입(타이별로 write,read) 할수 있다.
   단 조건은 자기들끼리만 .. output으로 쓴건 input으로만 읽어들일수있다.
   txt : 100,30,80,60 >>split >> convert(얘가머지?) >> 연산 ...  이런거 주민번호로 계산하기했었음    
   
 */


public class Ex13_DataOutPutStream {
	public static void main(String[] args) {
		int[] score = {100,60,55,94,23};
		FileOutputStream fos =null;
		DataOutputStream dos = null;
		try {
			fos = new FileOutputStream("score.txt"); //이빨대를 통해서 데이터를 보낼때 정수값으로 변환시킨것임 //깨져서 보내짐. //데이터인풋스트림을 통해서만 읽을 수 있다.
			dos = new DataOutputStream(fos);
			for(int i = 0;i<score.length; i++) {
				dos.writeInt(score[i]);  //정수값 write >> read DataInputStream
				//dos.writeUTF(str);//web 한글처리하는 방식   utf는 2byte이다.   //FileReaderWriter를 써도된당  IO는 이런식으로 겹치는 부분이 많다.
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
