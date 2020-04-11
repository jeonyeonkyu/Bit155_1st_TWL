import java.util.Scanner;

public class Password {
	
	Scanner sc = new Scanner (System.in);
	String str1 = "";
	String str2 ="";
	int count1 = 0;
	int count2 = 0;
	int count3 = 0;
	
	public Password(){
		System.out.println("=== 비밀번호 생성 ===");
	}
	
	public void makepass() {
		// TODO Auto-generated method stub
		System.out.println("비밀번호를 입력해주세요. (8글자 이상, 대문자/소문자/숫자 포함 )");
		str1 = sc.nextLine();
	}
	public void checkConfirmpass() {
		// TODO Auto-generated method stub

		for(;;){
		
			System.out.println("비밀번호를 입력해 주세요.(8글자 이상, 알파벳 숫자 특수기호");

			str1 = sc.nextLine();
			
			System.out.println("확인 비밀번호를 입력해주세요.");
			
			str2 = sc.nextLine();
			
		if(str1.equals(str2)){
		
			if(str1.length()<8){
				
				System.out.println("비밀번호가 8자리 이하 입니다.");
			
			}
		
			for(int i = 0; i<str1.length();i++){
			
				char ch = str1.charAt(i);
				if(65 <= ch && ch <= 90)
					
					count1++;
				
				else if (97 <= ch&& ch <=122)
				
					count1++;
				else if (48 <= ch && ch <= 57)
					
					count1++;
				else if(((ch >= 0x02) && (ch <= 0x2F)) ||
				
				((ch >= 0x3A) && (ch <= 0x40) ) ||
				
				((ch >= 0x5B) && (ch <= 0x60))) {

					count3++;
				}
			}
		
		if(count1 ==0){
			System.out.println("알파벳이 없습니다.");
		}
		if(count2 == 0){
			System.out.println("숫자가 없습니다.");
		}
		if(count3 == 0){
			System.out.println("특수문자가 없습니다.");
		}
		if(count1 > 0 && count2 > 0 && count3 >0){
			
			System.out.println("비밀번호가 생성되었습니다.");
			break;
		}
	}

	else{
			System.out.println("비밀번호가 일치하지 않습니다.");
			
		
	}

	continue;
		


		
	}	
	

}

}
