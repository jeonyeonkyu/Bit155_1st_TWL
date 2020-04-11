import java.util.Random;
import java.util.Scanner;


public class ScrambleGame extends PuzzleGame {
	
	Random rn = new Random();
	Scanner sc = new Scanner(System.in);
	Words words = new Words();
	String strArr[];
	String user;
	String userArr[];
	String correctArr[];
	int uNum1;
	int uNum2;
	
	public void info(){
		System.out.println("=== �������� ===");
		System.out.println("��ȯ�� ���ϴ� ������ �ε����� \",\"�� �����Ͽ� �Է��ϼ���");
		System.out.println("������ ������ ���߸� ����˴ϴ�.");
	}
	public void setAnswer(){
		strArr = words.getWord().split("");
		correctArr = words.getWord(words.Index).split("");
			for (int i = 0; i < strArr.length; i++) {

			int r = rn.nextInt(strArr.length - 1) + 0;
			String a;
			a = strArr[i];
			strArr[i] = strArr[r];
			strArr[r] = a;

			for (int j = 0; j < strArr.length; j++) {
				if (strArr[j] == strArr[i]) {
					r = rn.nextInt(strArr.length - 1) + 0;
					a = strArr[i];
					strArr[i] = strArr[r];
					strArr[r] = a;
				}
			}
		}
		
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
	public void check(){ //�̰ͺ��� 10������ �ߴ��� �ϱ�
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
			System.out.print("�����մϴ�. �����Դϴ�. ");
			System.out.print("(");
			System.out.print(words.getWord(words.Index));
			System.out.print(")");
			System.out.println();
			end();
		}else{
			System.out.println("�й��ϼ���!!");
		}
		
	}
}
