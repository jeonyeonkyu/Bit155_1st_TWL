
public class PuzzleGame {
	boolean isRun;
	
	public PuzzleGame(){
		isRun = true;
	}
	
	public void info(){
		System.out.println("=== �������� ===");
	}
	public void setAnswer(){
		System.out.println("(����������)");
	}
	public void start(){
		info();
		setAnswer();
		System.out.println("=== ���ӽ��� ===");
		while(isRun){
			process();
			check();
		}
	}
	public void process(){
		System.out.println("(������)");
	}
	public void check(){
		System.out.println("(����Ȯ����)");
	}
	public void end(){
		System.out.println("=== �������� ===");
		isRun = false;
	}
}
