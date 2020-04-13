import java.util.Random;
import java.util.Scanner;


public class ScrambleGame implements IPuzzleGame {
	
	Random rn = new Random();
	Scanner sc = new Scanner(System.in);
	Words words = new Words();
	String strArr[];
	int iIndex1=0;
	int iIndex2=0;
	String user;
	String userArr[];
	String correctArr[];
	int uNum1;
	int uNum2;
	boolean isRun = true;
	public void info(){
		System.out.println("=== 게임정보 ===");
		System.out.println("교환을 원하는 글자의 인덱스를 \",\"로 구분하여 입력하세요");
		System.out.println("게임은 정답을 맞추면 종료됩니다.");
	}
	public void setAnswer(){
		strArr = words.getWord().split("");
		correctArr = words.getWord(words.Index).split("");
		while(iIndex1 == iIndex2){	//중복검사
			iIndex1 = rn.nextInt(strArr.length)+0;
			iIndex2 = rn.nextInt(strArr.length)+0;
		}
		setScramble(iIndex1, iIndex2);
		
	}
	public void process(){
			
			setScramble();
		
			user=sc.next();
			userArr=user.split(",");
			uNum1 = Integer.parseInt(userArr[0]);
			uNum2 = Integer.parseInt(userArr[1]);
			
			setScramble(uNum1-1, uNum2-1);		
	}
	void setScramble(){
		
		for(int i = 0; i<strArr.length; i++){
			System.out.print(strArr[i]);
		}
		System.out.println();
	}
	void setScramble(int iIndex1, int iIndex2){
		String temp = strArr[iIndex1];
		strArr[iIndex1] = strArr[iIndex2];
		strArr[iIndex2] = temp;
	}
	public void check(){
		int countWrong = 0;
		for(int i = 0; i<strArr.length; i++){
			for(int j = 0; j<correctArr.length; j++){
				if(i==j){
					if(strArr[i].equals(correctArr[j])){
						
					}else{
						countWrong++;
					}
				}
			}
		}		
		if(countWrong==0){
			setScramble();
			System.out.print("축하합니다. 정답입니다. ");
			System.out.print("(");
			System.out.print(words.getWord(words.Index));
			System.out.print(")");
			System.out.println();
			end();
		}else{
			System.out.println("분발하세요!!");
		}
		
	}
	@Override
	public void start() {
		// TODO Auto-generated method stub
		info();
		setAnswer();
		System.out.println("=== 게임시작 ===");
		while(isRun){
			process();
			check();
		}
		
		
	}
	@Override
	public void end() {
		// TODO Auto-generated method stub
		System.out.println("=== 게임종료 ===");
		isRun = false;
		
	}
}
