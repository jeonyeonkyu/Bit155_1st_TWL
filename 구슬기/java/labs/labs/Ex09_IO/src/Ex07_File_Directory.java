import java.io.File;
import java.io.IOException;

/*
 I/O 작업
 파일과 폴더를 다룰 수 있는 클래스
 
 
 Java : 파일, 폴더   를하나의 클래스에 맡겨버림 그건 File class
 >> a.txt 생성, 수정, 삭제, 정보 read
 >> Temp 생성, 삭제, 정보 read
 
 C#(File) ,폴더(Directory)
 
 
 경로
 절대경로 : C:\\, D:\\ >>C:\\Temp\\a.txt
 상대경로 : 현재파일을 중시믕로    C:\\Temp\\a.txt >> ../  >> /
 */


public class Ex07_File_Directory {
	public static void main(String[] args) throws IOException {
		String path = "C:\\Temp\\file.txt";
		
		//파일클래스가 어떤 정보를 넣어주면 그정보로 다양한 활동을 할수 있구나..
		
		File f = new File(path);
		//f.createNewFile();  파일은 createNewFile() 를 호출할때 생성된다.
		//File 클래스를 통해서 ( 다양한 정보)
		String filename = f.getName();
		System.out.println("파일명: "+ filename);
		System.out.println("(중요)전체경로: "+ f.getPath()); //이파일이 갖고있는 정보값을 얻을수 있음. //전체경로: C:\Temp\file.txt
		System.out.println("절대경로: "+ f.getAbsolutePath()); //얘는 드라이브 까지 가져온다.
		System.out.println("(중요)너 폴더니?: "+ f.isDirectory());
		System.out.println("(중요)너 파일이니?: "+ f.isFile());
		System.out.println("파일크기: "+ f.length()+"byte"); //파일크기: 11byte  //Hello World
		System.out.println("부모경로: "+ f.getParent()); //부모경로: C:\Temp //나를 제외한 상위경로
		System.out.println("(중요)존재여부(파일,폴더): "+ f.exists()); //true
		
		
		//f.delete()  return >> true, false
		//f.canRead() 읽기 가능하니...?    
		//f.canWrite()

	}

}
