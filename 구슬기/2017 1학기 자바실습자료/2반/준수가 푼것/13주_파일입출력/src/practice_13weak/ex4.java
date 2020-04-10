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
 	//한 라인씩 읽어냄
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
	        // 생성된 InputStream Object를 닫아준다.
	    		fi.close();
	        } catch(IOException e) {
	        	System.out.println(e);
	        }
	    }
		
		
		
		//출력부 분리
		int count=0;
		String[] trans;
		System.out.println("=== word count ===");
		//10주 ex1 문자판별, 12주 array클래스
		for(int i=0; i<strarr.length ; i++){
			if(strarr[i].matches("^[ㄱ-ㅎ가-힣]*$")){
				count++;
			}
		}
		trans = new String[count];
		count=0;
		for(int i=0; i<strarr.length ; i++){
			if(strarr[i].matches("^[ㄱ-ㅎ가-힣]*$")){
				trans[count]=strarr[i];
				count++;
			}
		}
		count=1;
		//이중 for문 사용해서 한글만 들어간걸 뽑아냄
		//안쪽 for는 중복된 값 있으면 count ++;
		Arrays.sort(trans);//중복값은 연속해서 표현
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
		//sort출력시이전 값과 중복이라면  출력 안하고  ++
	}
}