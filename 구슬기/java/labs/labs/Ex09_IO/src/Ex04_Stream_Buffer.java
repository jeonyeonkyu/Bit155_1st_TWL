import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
 File 처리(DISK) read , write
 원래는 한 Byte씩  read , write
 모아 모아서 한번에 가져가서 read , write 하는 것이 지금의 목적이다! (버스타고 한번에 가자)
 버스 >> Buffer 
 File read, write 중간 Buffer >> I/O
 
 1.I/O 여러번 왔다갔다 하는게 아니라 한번에 버스(Buffer)로 챙겨서 풀어놓겠다! ...성능개선
 2.Line 단위(엔터) 를 할수있다.  되게 편한거임.. ㅇ
 
 독자적인 객체생성 불가( 주 클래스에 의존함)
 
 한글은 깨져서 표현불가능 
 */
public class Ex04_Stream_Buffer {
	public static void main(String[] args) {
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		try {
			fos = new FileOutputStream("data.txt"); //default : false : 파일 생성
			bos = new BufferedOutputStream(fos);
			
			for(int i = 0 ; i < 10 ; i++) {
				bos.write('A'); //보스로 버스태워서 파일아웃풋스트림에준다.
			}
			//Java Buffer 크기 > 8kbyte => 8192byte 자까지 가능
			//1.buffer 안에 내용이 8kbyte 이 다 재춰지면 스스로 비우는 작업을 한다.(내부적으로 flush(내보내기))
			//2.buffer 강제로 비우기 ( flush 또는 close)
			//3. bos.close() 자원해제하는거(더이상안써요~하고 닫기) >> close() >>내부적으로 flush 호출 
			
			//야 내려 ... data.txt 쓰는 작업 수행 (x)
			//버스 (65석) 좌석이 찰때까지 출발 하지 않음. 버퍼를 쓰지 않음. 강제로쓰게하는것. flush() or close()   이다.
			//bos.flush();
		}catch (Exception e) {
			
		}finally {
			try {
				bos.close(); //flush  //열었던 순서대로 닫아주면 된다.
				fos.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
			
		}
	}

}







