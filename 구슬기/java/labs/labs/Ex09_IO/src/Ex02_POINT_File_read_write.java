import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/*
read ,write 대상 File (물리적인 파일) >> 1.txt, data.txt
FileInputStream
FileOutputStream

 C:\\IOtemp\\a.txt\\Hello 
 
 */
public class Ex02_POINT_File_read_write {
	public static void main(String[] args) {
		/*
		try {
			//POINT : I/O 작업은 대부분 가비지 컬렉터의 대상이 아니다.
			//명시적인 자원의 해체를(반환작업) 해줘야함 >> close() >>내부적으로 소멸자를 호출하는 방식)
			
			FileInputStream fs = new FileInputStream("C:\\IOTemp\\a.txt");
		//이 빨대는 한글을 못읽는다. 
			int data = 0;
			while((data = fs.read()) != -1) {
				System.out.println("정수(숫자) :" + data);
				//문자값으로..
				char c = (char)(data);
				System.out.println(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//정상, 비정상 무조건 실행되는 블럭
			fs.close();
		}
		*/
		
		FileInputStream fs =null;
		FileOutputStream fos = null;
		String path = "C:\\IOTemp\\a.txt";
		try {
			//POINT : I/O 작업은 대부분 가비지 컬렉터의 대상이 아니다.
			//명시적인 자원의 해체를(반환작업) 해줘야함 >> close() >>내부적으로 소멸자를 호출하는 방식)
			
			 fs = new FileInputStream(path);
		//이 빨대는 한글을 못읽는다. 
			 fos = new FileOutputStream("C:\\IOTemp\\new.txt",true);  
			 //write
			 //FileOutputStream 파일 생성기능을 가지고 있을까
			 //파일에 write 할때 파일이 존재하지 않으면 [파일생성도 한다.]
			 
			 //new FileOutputStream("C:\\IOTemp\\new.txt",false);   false가  default 옵션이다. 
			 //기존 데이터에 overwrite 다.   덮어버린당 .
			 
			 //fos = new FileOutputStream("C:\\IOTemp\\new.txt",true);  
			 //기존 데이터 append  이건 누적된다.
			 
			 
			 
			int data = 0;
			while((data = fs.read()) != -1) {
//				System.out.println("정수(숫자) :" + data);
//				//문자값으로..
//				char c = (char)(data);
//				System.out.println(c);
				fos.write(data);  //data 값을 읽어서 C:\\IOTemp\\new.txt 여기에 쓴다.   read >>write
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {  //예외가 발생하던 아니던 자원해지하려고 하는거다. 
			//정상, 비정상 무조건 실행되는 블럭
			
			try{
				fs.close(); //닫아주기 
				fos.close(); 
			
			}catch(IOException e) {
				e.printStackTrace();
			}
		
		}
		
		

	}

}
