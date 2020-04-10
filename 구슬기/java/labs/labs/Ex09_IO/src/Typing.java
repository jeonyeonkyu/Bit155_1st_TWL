import java.io.BufferedReader;
import java.io.FileReader;

public class Typing {

	public static void main(String[] args) {
		/* 
          명령프롬프트에서 실행
          전달받은 파일의 내용을 콘솔창에 출력      		    
		 >cd java0514
		 >cd workspace
		 >cd basicjava
		 >cd src
		 >dir
		 >javac Typing.java
		 >java Typing d:\java0514\workspace\sungjuk.txt
		 >java Typing Typing.java		 
		 */
		try{
			String fileName=args[0]; 
			
			FileReader in=new FileReader(fileName);  // 읽으려고 준비중
			BufferedReader br=new BufferedReader(in); //데려가려고 준비중
			while(true){
				String line=br.readLine();  //BufferedReader로 읽어온걸 line 에 넣음
				if(line==null){
					break; // 읽어온 값이 없을때 가장 가까운 반복문을 나감.while나감
				}
				System.out.println(line); //출력
			}//while end
			
			br.close();    //열었던거 순서대로 닫기
			in.close();
			
		}catch(Exception e){
			System.out.println("File Not Found!!"+e);
		}//try end
		
	}//main() end
}//class end