import java.io.DataInputStream;
import java.io.FileInputStream;

public class Ex14_DataInPutStream {
	public static void main(String[] args) {
		int sum = 0;
		int score = 0;
		FileInputStream fis = null;
		DataInputStream dis = null;

		
		//score 배열안의 값을 읽어와서 합계구하기
		
		try {
			fis = new FileInputStream("score.txt"); // 에 빨대를 꽂고 쭉읽어들일예정
			dis = new DataInputStream(fis); // 번역기를 통해서 번역하겠다 로 봐도 되겠어.
			while (true) {
				score = dis.readInt();
				System.out.println("score int 타입:" + score);
				sum += score;
			}
		} catch (Exception e) {
			System.out.println("예외발생: " + e.getMessage());
			System.out.println("sum 결과:" + sum);
		} finally {
			try {
				dis.close();
				fis.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
}
