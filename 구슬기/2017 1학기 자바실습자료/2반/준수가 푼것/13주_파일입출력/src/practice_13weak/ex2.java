package practice_13weak;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class ex2 {
	public static void main(String[] args){
		Managerplay mp = new Managerplay();
	}
}

class Managerplay{
	public Managerplay(){
		player();
	}
	private void player(){
		System.out.println("=====���� ������=====");
		Scanner sc = new Scanner(System.in);
		StringManager strm = new StringManager();
		while(true){
			System.out.println("��带 �����Ͻÿ�(1 = �Է¸�� / 2 = ��¸�� / 3 = ����)");
			int i = sc.nextInt();
			if(i==3){
				System.out.println("�ý����� �����մϴ�.");
				break;
			}else if(i==1){
				strm.InputString();
			}else if(i==2){
				strm.PrintString();
			}else{
				System.out.println("�峭ġ�� ������!");
			}
		}
	}
}
class StringManager{
	private static Scanner sc = new Scanner(System.in); 
	static StringBuffer str = new StringBuffer();
	void InputString(){
		//���⼭ sc.nextInt �ϰ� Line�ϸ� ����! sc��ü�� Int ���� flush�� ���������
		System.out.println("���ڸ� �Է��Ͻÿ� !");
		str.append(sc.nextLine()+"\n");
		try{
			FileWriter fw = new FileWriter("test.txt");
			fw.write(str.toString());
			fw.close();
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	void PrintString(){
		FileInputStream fr = null;
		try {
			byte[] b = new byte[1024];
			fr = new FileInputStream("test.txt");
	        fr.read(b);
	        System.out.println(new String(b));
	    } catch (IOException e) {
	    	System.out.println(e);
	    } finally {
	    	try{
	        // ������ InputStream Object�� �ݾ��ش�.
	    		fr.close();
	        } catch(IOException io) {}
	    }
	}
}
