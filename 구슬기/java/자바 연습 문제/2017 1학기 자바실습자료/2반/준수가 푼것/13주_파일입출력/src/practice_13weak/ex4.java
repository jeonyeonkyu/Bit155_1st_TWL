package practice_13weak;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Set;


/*
 	filewriter fw
 	fw.write
 	system.out.println
 	fw close
 	
 	
 	
 	
 	
 	bufferreader br = new bufferedreader(fileReader filelink);
 	string temp
 	while((temp = br.readLine()) !=null){
 	sb.append(temp)
 	}
 	//ÇÑ ¶óÀÎ¾¿ ÀÐ¾î³¿
 */
public class ex4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		print pt = new print();
	}

}
class print{
	public print(){
		printtext();
	}
	private String str = null;
	private String[] strarr = null;
	private FileInputStream fi = null;
	
	private void printtext(){

		try {
			byte[] b = new byte[1024];
			fi = new FileInputStream("text.txt");
	        fi.read(b);
	        str = new String(b);
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
		
		
		
		//Ãâ·ÂºÎ ºÐ¸®
		int count=0;
		String[] trans;
		System.out.println("=== word count ===");
		//10ÁÖ ex1 ¹®ÀÚÆÇº°, 12ÁÖ arrayÅ¬·¡½º
		for(int i=0; i<strarr.length ; i++){
			if(strarr[i].matches("^[¤¡-¤¾°¡-ÆR]*$")){
				count++;
			}
		}
		trans = new String[count];
		count=0;
		for(int i=0; i<strarr.length ; i++){
			if(strarr[i].matches("^[¤¡-¤¾°¡-ÆR]*$")){
				trans[count]=strarr[i];
				count++;
			}
		}
		count=1;
		//ÀÌÁß for¹® »ç¿ëÇØ¼­ ÇÑ±Û¸¸ µé¾î°£°É »Ì¾Æ³¿
		//¾ÈÂÊ for´Â Áßº¹µÈ °ª ÀÖÀ¸¸é count ++;
		Arrays.sort(trans);//Áßº¹°ªÀº ¿¬¼ÓÇØ¼­ Ç¥Çö
		for(int i=0; i<trans.length; i++){
			if(i==(trans.length-1)){
				System.out.print(trans[i-count+1] + " : ");
				System.out.print(count + "\n");
				break;
			}else if(trans[i].equals(trans[i+1])){
				count++;
			}else{
				System.out.print(trans[i-count+1] + " : ");
				System.out.print(count + "\n");
				count=1;
			}
		}
		// System.out.println(trans.length);
		//sortÃâ·Â½ÃÀÌÀü °ª°ú Áßº¹ÀÌ¶ó¸é  Ãâ·Â ¾ÈÇÏ°í  ++
	}
}