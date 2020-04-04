import java.io.File;
import java.io.IOException;

/*
 I/O �۾�
 ���ϰ� ������ �ٷ� �� �ִ� Ŭ����
 
 
 Java : ����, ����   ���ϳ��� Ŭ������ �ðܹ��� �װ� File class
 >> a.txt ����, ����, ����, ���� read
 >> Temp ����, ����, ���� read
 
 C#(File) ,����(Directory)
 
 
 ���
 ������ : C:\\, D:\\ >>C:\\Temp\\a.txt
 ����� : ���������� �߽Ò׷�    C:\\Temp\\a.txt >> ../  >> /
 */


public class Ex07_File_Directory {
	public static void main(String[] args) throws IOException {
		String path = "C:\\Temp\\file.txt";
		
		//����Ŭ������ � ������ �־��ָ� �������� �پ��� Ȱ���� �Ҽ� �ֱ���..
		
		File f = new File(path);
		//f.createNewFile();  ������ createNewFile() �� ȣ���Ҷ� �����ȴ�.
		//File Ŭ������ ���ؼ� ( �پ��� ����)
		String filename = f.getName();
		System.out.println("���ϸ�: "+ filename);
		System.out.println("(�߿�)��ü���: "+ f.getPath()); //�������� �����ִ� �������� ������ ����. //��ü���: C:\Temp\file.txt
		System.out.println("������: "+ f.getAbsolutePath()); //��� ����̺� ���� �����´�.
		System.out.println("(�߿�)�� ������?: "+ f.isDirectory());
		System.out.println("(�߿�)�� �����̴�?: "+ f.isFile());
		System.out.println("����ũ��: "+ f.length()+"byte"); //����ũ��: 11byte  //Hello World
		System.out.println("�θ���: "+ f.getParent()); //�θ���: C:\Temp //���� ������ �������
		System.out.println("(�߿�)���翩��(����,����): "+ f.exists()); //true
		
		
		//f.delete()  return >> true, false
		//f.canRead() �б� �����ϴ�...?    
		//f.canWrite()

	}

}
