package practice_13weak;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class ex5 {
	public static void main(String[] args){
		printnum pt = new printnum();
	}
}

//�� �� õ
class printnum{
	private String str = null;
	private String[] strarr = null;
	private BufferedReader br;
	private FileReader fr;
	private StringBuffer sb = new StringBuffer();
	public printnum(){
		printtext();
	}
	private void printtext(){

		try {
			fr = new FileReader("text.txt");
			br = new BufferedReader(fr);
		 	String temp=null;
		 	while((temp = br.readLine()) !=null){
		 		sb.append(temp + "\n");
		 	}
	    } catch (IOException e) {
	    	System.out.println(e);
	    } finally {
	    	try{
	        // ������ InputStream Object�� �ݾ��ش�.
	    		fr.close();
	    		br.close();
	        } catch(IOException e) {
	        	System.out.println(e);
	        }
	    }
		String[] str = sb.toString().split("\n");
		int[] num = new int[str.length];
		for(int i =0 ; i<str.length ;i++){
			num[i]=Integer.parseInt(str[i]);
			System.out.print(str[i] + "\t");
			System.out.println(convertHangul(str[i]));
		}
	}
		public String convertHangul(String money){ 
			String[] han1 = {"","��","��","��","��","��","��","ĥ","��","��"}; 
			String[] han2 = {"","��","��","õ"}; String[] han3 = {"","��","��","��","��"}; 
			StringBuffer result = new StringBuffer(); 
			int len = money.length(); 
			for(int i=len-1; i>=0; i--){ 
				result.append(han1[Integer.parseInt(money.substring(len-i-1, len-i))]); 
				if(Integer.parseInt(money.substring(len-i-1, len-i)) > 0) 
					result.append(han2[i%4]); 
				if(i%4 == 0) result.append(han3[i/4]); 
				} 
			return result.toString(); 
		}

//	��ó: http://anatomylab.tistory.com/9 [�غ��п�����]
}