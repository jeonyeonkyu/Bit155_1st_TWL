import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

//Reader
//Writer 작업시 성능(buffer)
//buffer Line 단위(장점)

public class Ex06_FileReader_FileWriter_Buffer {
	public static void main(String[] args) throws Exception {
		FileWriter fw = new FileWriter("Lotto.txt",true); //true  는 덮어쓰기
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write("로또");
		bw.newLine();
		bw.write("1,45,20,4,3,5");
		bw.newLine();
		bw.flush();

		
		/*
		FileReader fr = null;
		BufferedReader br = null;
		
		try {
		fr = new FileReader("Ex01_Stream.java");
		br = new BufferedReader(fr);
		String line="";
		for(int i = 0; (line=br.readLine())!=null ;i++) {
			System.out.println(line);
			
			if(line.indexOf(";") != -1) { //뒤에 ;있는 것만 출력 되게함. //indexOf 활용법 (찾으려는 값이 0보다 크다는 전제조건)
				                           //기본틀을 강사님이 주시면 이것저것 활용해보자. 구글검색하면서...
				System.out.println(line);
			}
		}
		} catch (Exception e) {
		
		}finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		*/

	}

}
