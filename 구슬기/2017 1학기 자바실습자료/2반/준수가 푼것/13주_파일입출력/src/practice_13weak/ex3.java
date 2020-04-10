package practice_13weak;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;



public class ex3 {
	public static void main(String[] args){
		int[] a = new int[10];
		Random rd = new Random();
		evenNumber num = new evenNumber();
		System.out.println("È¦ / Â¦ ÆÇº°");
		for(int i=0; i<10; i++){
			a[i] = rd.nextInt(100)+1;
			num.process(a[i]);
		}
		System.out.println();
		num.readnumber();
		num.transwritenumber();
	}
}


class oddNumber{
	//È¦¼ö Ãâ·Â
	StringBuffer strbuf = new StringBuffer();
	String[] strarr;
	public void printInfo(int num){
		try{
			FileOutputStream fo;
			fo = new FileOutputStream("result.txt");
			
			System.out.println(num + " : " + "È¦¼ö ÀÔ´Ï´Ù.");
			strbuf.append(num + " : " + "È¦¼ö ÀÔ´Ï´Ù." + "\r\n");
			fo.write(strbuf.toString().getBytes());
			fo.close();
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}

class evenNumber extends oddNumber{
	public evenNumber(){
	}
	//È¦Â¦ ÆÇº°
	public void process (int num){
		if(num%2==0){
			printInfo(num);
		}else{
			super.printInfo(num);
		}
	}
	public void printInfo(int num){
		try {
			FileOutputStream fo;
			fo = new FileOutputStream("result.txt");
			
			System.out.println(num + " : " + "Â¦¼ö ÀÔ´Ï´Ù.");
			strbuf.append(num + " : " + "Â¦¼ö ÀÔ´Ï´Ù." + "\r\n");
			fo.write(strbuf.toString().getBytes());
			fo.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void readnumber(){
			FileInputStream fi = null;
			try {
				byte[] b = new byte[1024];
				fi = new FileInputStream("result.txt");
		        fi.read(b);
		        String str = new String(b);
		        strarr = str.split(" ");
		    } catch (IOException e) {
		    	System.out.println(e);
		    } finally {
		    	try{
		        // »ý¼ºµÈ InputStream Object¸¦ ´Ý¾ÆÁØ´Ù.
		    		fi.close();
		        } catch(IOException e) {
		        	System.out.println(e);
		        }
		    }
	}
	public void transwritenumber(){
		strbuf = new StringBuffer();
		Random rd1 = new Random();
		for(int i=0; i<strarr.length; i++){
			System.out.println(strarr[i]);
			if(strarr[i].equals("È¦¼ö")){
				try {
					FileOutputStream fo;
					fo = new FileOutputStream("reverseResult.txt");
					strbuf.append((rd1.nextInt(50)*2-1) + " : " + "È¦¼ö ÀÔ´Ï´Ù." + "\r\n");
					fo.write(strbuf.toString().getBytes());
					fo.close();
				} catch (Exception e) {
					// TODO: handle exception
				}
			}else if(strarr[i].equals("Â¦¼ö")){
				try {
					FileOutputStream fo;
					fo = new FileOutputStream("reverseResult.txt");
					strbuf.append((rd1.nextInt(50)*2) + " : " + "Â¦¼ö ÀÔ´Ï´Ù." + "\r\n");
					fo.write(strbuf.toString().getBytes());
					fo.close();
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}
	}
}
