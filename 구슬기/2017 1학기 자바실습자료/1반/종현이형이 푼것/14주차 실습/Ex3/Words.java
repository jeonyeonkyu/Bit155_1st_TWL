import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.*;

public class Words {
	public int Index;
	Random rn = new Random();
	
	FileInputStream in = null;
	FileOutputStream out = null;
	
	try{
		in = new FileInputStream("words.txt");
		out = new FileOutputStream("rank.txt");
		int c ;
		
		while ((c = in.read() ) != -1){
			out.write(c);

		}
	}
		catch(Exception e)
		{
		}
}

}




