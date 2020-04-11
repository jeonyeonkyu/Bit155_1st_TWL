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
		System.out.println("=====문자 편집기=====");
		Scanner sc = new Scanner(System.in);
		StringManager strm = new StringManager();
		while(true){
			System.out.println("모드를 선택하시오(1 = 입력모드 / 2 = 출력모드 / 3 = 종료)");
			int i = sc.nextInt();
			if(i==3){
				System.out.println("시스템을 종료합니다.");
				break;
			}else if(i==1){
				strm.InputString();
			}else if(i==2){
				strm.PrintString();
			}else{
				System.out.println("장난치지 마세요!");
			}
		}
	}
}
class StringManager{
	private static Scanner sc = new Scanner(System.in); 
	static StringBuffer str = new StringBuffer();
	void InputString(){
		//여기서 sc.nextInt 하고 Line하면 에러! sc객체에 Int 값을 flush로 지워줘야함
		System.out.println("문자를 입력하시오 !");
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
	        // 생성된 InputStream Object를 닫아준다.
	    		fr.close();
	        } catch(IOException io) {}
	    }
	}
}
