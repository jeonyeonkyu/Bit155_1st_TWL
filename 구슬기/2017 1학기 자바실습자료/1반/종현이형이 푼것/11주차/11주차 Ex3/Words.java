import java.util.Random;


public class Words {
	public int Index;
	Random rn = new Random();
	String[] words = {"java", "import", "class", "public", "private", 
			"overloading", "method", "inheritance", "encapsulation","polymorphism"};
	public String getWord() {
		Index = rn.nextInt(10)+0;
		return words[Index];
	}
	public String getWord(int mIndex){
		return words[mIndex];
	}
}
