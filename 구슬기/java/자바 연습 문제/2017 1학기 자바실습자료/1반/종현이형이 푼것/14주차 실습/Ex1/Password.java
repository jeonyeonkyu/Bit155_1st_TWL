import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Password {
	
	Scanner sc = new Scanner (System.in);
	String str1 = "";
	String str2 ="";
	int count1 = 0;
	int count2 = 0;
	int count3 = 0;
	
	public Password(){
		System.out.println("=== ��й�ȣ ���� ===");
	}
	
	public void makepass() {
		// TODO Auto-generated method stub
		
		for(;;){
			System.out.println("��й�ȣ�� �Է����ּ���.(8���� �̻�, ���� Ư����ȣ)");
			str1 = sc.nextLine();
			System.out.println("Ȯ�� ��й�ȣ�� �Է��� �ּ���");
			str2 = sc.nextLine();
			
			if(str1.equals(str2)){
				if(str1.length()<8){
					System.out.println("��й�ȣ�� 8�ڸ� �����Դϴ�.");
					
				}
				for(int i = 0; i<str1.length();i++){
					char ch = str1.charAt(i);
					if(65<=ch && ch <=90)
						count1++;
					else if(97<=ch && ch <=122)
						count1++;
					else if(48<=ch && ch <=57)
						count2++;
					else if(((ch>= 0x02) && (ch<=0x2F)) ||
							
							((ch>= 0x3A) && (ch<=0x40)) ||
						
							((ch>= 0x5B) && (ch<=0x60))){
						
						count3++;
								
							}
				}
					if(count1==0){
						System.out.println("���ĺ��� �����ϴ�.");
					}
					if(count2==0){
						System.out.println("���ڰ� �����ϴ�.");
					}
					if(count3==0){
						System.out.println("Ư�����ڰ� �����ϴ�.");
					}
					if(count1 >0 && count2 > 0 && count3 >0){
						System.out.println("��й�ȣ�� �����Ǿ����ϴ�.");
						try{
							FileWriter fw = new FileWriter("pwd.txt");
							fw.write(str1);
							fw.close();
						}
						catch(IOException e){
							e.printStackTrace();
						}
						break;
					}
					
			}
			else{
				System.out.println("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				continue;
				
					
				}
			continue;
			}
	}
	public void checkConfirmpass() {
		// TODO Auto-generated method stub

	
		
		
	}	
	

}


