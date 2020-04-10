import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;

//출력형식 정의
//친척 : printf , String.format()
public class Ex11_PrintWriter {
	public static void main(String[] args) {
		try {
			//console 작업을  txt 파일에다 작업 ..
			PrintWriter pw = new PrintWriter("C:\\Temp\\homework.txt"); //모양낼때 쓰면 좋다.println과 똑같은 기능을쓸수있다.
			pw.println("*******************************************");
			pw.println("*             HOMEWORK                    *");
			pw.println("*******************************************");
			pw.printf("%3s : %5d  %5d  %5d  %5.1f", "아무개",100,90,50,(float)((100+90+50)/3));
			pw.println();
			pw.close(); //close() 
			//폴더 만들고 쓰는것까지
			
			//쓴 파일을 읽는거
			//homework.txt read (Line) 
			//
			FileReader fr = new FileReader("C:\\Temp\\homework.txt");
			BufferedReader br = new BufferedReader(fr);
			String s="";
			while((s = br.readLine()) != null) {
				System.out.println(s);
			}
			br.close();
			fr.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			
			//여기다 .. ^^!
		}
	}

}
