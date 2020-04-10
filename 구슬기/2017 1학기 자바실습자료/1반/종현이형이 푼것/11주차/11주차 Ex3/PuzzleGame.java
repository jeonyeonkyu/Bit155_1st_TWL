
public class PuzzleGame {
	boolean isRun;
	
	public PuzzleGame(){
		isRun = true;
	}
	
	public void info(){
		System.out.println("=== 게임정보 ===");
	}
	public void setAnswer(){
		System.out.println("(문제내는중)");
	}
	public void start(){
		info();
		setAnswer();
		System.out.println("=== 게임시작 ===");
		while(isRun){
			process();
			check();
		}
	}
	public void process(){
		System.out.println("(게임중)");
	}
	public void check(){
		System.out.println("(정답확인중)");
	}
	public void end(){
		System.out.println("=== 게임종료 ===");
		isRun = false;
	}
}
