package Ex09_IO;

import java.io.File;
import java.io.IOException;

/*
I/O 작업
파일과 폴더를 다룰수 있는 클래스

Java : 파일 , 폴더 하나의 클래스 : File
>> a.txt  생성, 수정 , 삭제 , 정보 read
>> Temp   생성, 삭제 , 정보 read

C# : 파일 (File)  , 폴더 (Directory)

경로
절대경로 : C:\\ , D:\\  >> C:\\Temp\\a.txt
상대경로 : 현재 파일을 중심으로      C:\\Temp\\a.txt  >> ../   >>  /

*/
public class Ex07_File_Directory {
    public static void main(String[] args) throws IOException {
        String path = "C:\\Temp\\file.txt";
        File f = new  File(path);
        //f.createNewFile();  함수를 호출할때 파일 생성
        //File 클래스를 통해서  (다양한 정보)
        String filename = f.getName();
        System.out.println("파일명 : " + filename);
        System.out.println("*전체경로 : " + f.getPath());
        System.out.println("절대경로 : " + f.getAbsolutePath());
        System.out.println("*너 폴더니 : " + f.isDirectory());
        System.out.println("*너 파일이니 : " + f.isFile());
        System.out.println("*파일크기 : " + f.length() + "byte");
        System.out.println("부모경로 : " + f.getParent());
        System.out.println("*존재여부(파일,폴더) : " + f.exists());

        //f.delete()  return >> true, false
        //f.canRead() 읽기 가능하니 ...
        //f.canWrite()
    }

}
