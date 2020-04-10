import java.io.File;

public class Ex08_File_Directory {
	public static void main(String[] args) {
		//java Ex08_File_Directory aaa엔터  하면 args 에 들어간대..
//		System.out.println(args.length);
//		System.out.println(args[0]);
		if(args.length != 1) {
			System.out.println("사용법:java 파일명 [디렉토리]");
			System.exit(0); //강제종료
		}
		File f = new File(args[0]);
		if(!f.exists() || !f.isDirectory()) {
			//존재하지 않거나 또는 디렉토리(폴더)가 아니라면
			System.out.println("유효하지 않은 경로입니다.");
			System.exit(0);//강제종료
		}
		//실제 존재하는 경로에 있는 폴더 라면  요게 중요
		
		File[] files = f.listFiles(); //당신이 제공한 폴더 안에 있는 모든 폴더와 파일 들고 오겠다.
		//C:\\Temp\\1.jpg >>하나하나 를 File 객체에 담아서...
		//C:\\Temp\\a.txt
		for(int i = 0;i< files.length ;i++) {
			String name = files[i].getName(); //파일며으 폴더명
			System.out.println(files[i].isDirectory() ? "[DIR]"+name: name);
		}

	}

}
