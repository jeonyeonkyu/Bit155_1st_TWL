import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

class ScrambleGame{
	Scanner sc = new Scanner(System.in);
	Words words = new Words();
	String name = "";
	Random rd = new Random();
	String[] name2;
	boolean b = true;
	String input;
	String[] input2;

	public void start() {
		System.out.println("=== ���� ���� ===");
		setScramble(); //���� ����
		while(b){
			
			System.out.print("��ȣ �Է� : ");
			input = sc.nextLine();
			
			input2 = input.split(","); 
	
			int index1 = Integer.parseInt(input2[0]);
			int index2 = Integer.parseInt(input2[1]);
			
			setScramble(index1-1, index2-1); //����ڰ� ������ �ڸ� ü����
			checkWord();
		}
		
	}
	
	void setScramble(){
		
		name = words.getWord(); // String name ="";
	
	    name2 = name.split("");     //String �迭
	    
		for(int i=0; i<name2.length; i++){
			
			int r = rd.nextInt(name2.length-1)+0;
			String a;
			a = name2[i];
			name2[i] = name2[r];
			name2[r] = a;
			

			for(int j=0; j<name2.length; j++){
				if(name2[j] == name2[i]){
					r = rd.nextInt(name2.length-1)+0;
					a = name2[i];
					name2[i] = name2[r];
					name2[r] = a;
				}		
			}
		}

		System.out.print("���� : ");
		
		for(int i=0; i<name2.length; i++){
			
			System.out.print(name2[i]);
			
		}
		System.out.println();
		
		
	}
	
	void setScramble(int iIndex1, int iIndex2){
		String c;
		c = name2[iIndex1] ;
		name2[iIndex1] = name2[iIndex2];
		name2[iIndex2] = c;
		
	}
	
	void checkWord(){
		
	
		for(int i=0; i<name2.length; i++){
			System.out.print("���� :");
			for(int j=0; j<name2.length; j++){
				System.out.print(name2[j]);
			}
			
			String[] name3 = name.split("");
			
			if(Arrays.equals(name3, name2) == true){
				
				System.out.println();
				System.out.println("�����մϴ�. �����Դϴ�.");
				end();
				break;
				
			}
			else {
					
				System.out.println();
				System.out.println("���� �� �й��ϼ���.");	
				break;
			
		}
	

		}
	}
	
	void end(){
		
		System.out.println("������ �����մϴ�.");
		b=false;
		
	}
	
	
}


class Words {
	
	
	String[] words = {"java", "import", "class", "public", "private", 
			"overloading", "method", "inheritance", "encapsulation","polymorphism"};
	

	public String getWord(){
		Random rd = new Random();
	
		int count = rd.nextInt(9)+0;
		
		return words[count];
		
	}
	
	public String getWord(int mIndex) {
		return null;
		
		
	}
}