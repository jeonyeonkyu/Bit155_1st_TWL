import java.io.BufferedReader;
import java.io.FileReader;

public class Typing {

	public static void main(String[] args) {
		/* 
          ���������Ʈ���� ����
          ���޹��� ������ ������ �ܼ�â�� ���      		    
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
			
			FileReader in=new FileReader(fileName);  // �������� �غ���
			BufferedReader br=new BufferedReader(in); //���������� �غ���
			while(true){
				String line=br.readLine();  //BufferedReader�� �о�°� line �� ����
				if(line==null){
					break; // �о�� ���� ������ ���� ����� �ݺ����� ����.while����
				}
				System.out.println(line); //���
			}//while end
			
			br.close();    //�������� ������� �ݱ�
			in.close();
			
		}catch(Exception e){
			System.out.println("File Not Found!!"+e);
		}//try end
		
	}//main() end
}//class end