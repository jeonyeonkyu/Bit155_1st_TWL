
public class Ex06_Operation {
	public static void main(String[] args) {
		int sum = 0;
		// 대입연산자 : += , -= , *= , .....
		sum += 1; // sum = sum + 1;
		sum -= 1; // sum = sum - 1;
		System.out.println("sum: " + sum);

		// 간단한 학점 계산기
		// 학점 : A+ A- B+ B- .....F
		// 데이터 점수 : 94점

		// 판단기준 : 90이상이냐...A
		// 그런데 95이상이냐 ...A+
		// 아닌데 ...A-

		int score = 90;
		String grade = ""; // 문자열의 초기화 빈문자 준거임
		System.out.println("당신의 점수는 :" + score);

		// 학점계산 로직
		if (score >= 90) {
			grade = "A";
			if (score >= 95) {
				grade += "+";// grade = grade = "+"
			} else {
				grade += "-";// grade = grade + "-"
			}

		} else if (score >= 80) {
			grade = "B";
			if (score >= 85) {
				grade += "+";// grade = grade = "+"
			} else {
				grade += "-";// grade = grade + "-"
			}
		} else if (score >= 70) {
			grade = "C";
			if (score >= 75) {
				grade += "+";// grade = grade = "+"
			} else {
				grade += "-";// grade = grade + "-"
			}
		} else {
			grade = "F";
		}

		System.out.println("당신의 학점은 ..." + grade);

		// syso + Ctrl + space 자동완성

		// 소스 정렬하기 (자동정렬)
		// ctrl + A >> Ctrl+shift+F (자동정렬)
		
		int data =50;
		switch(data) {
		case 100 : System.out.println("100입니다");
		    break;
		case 90 : System.out.println("90입니다");
		    break;
		case 80 : System.out.println("80입니다");
		    break;
		default : System.out.println("default");	
			
		}
		
        //Q: break 강제 사항 입니까...?꼭 써야만 합니까? A: 내가쓰고싶음 쓰고 아님 말고 ,필요에따라 쓰면됨
		//break 조건 만족하는 그 이후부터 모두 실행
		 data =80;
		switch(data) {
		case 100 : System.out.println("100입니다");		    
		case 90 : System.out.println("90입니다");		    
		case 80 : System.out.println("80입니다");		   
		default : System.out.println("default");	
			
		} //80입니다 default  걸리는것부터 break없을때 쭉내려감!!!!!!!!!!!!!
		
		
		int month = 2;
		String res ="";
		switch(month) {
		case 1: 
		case 3: 
		case 5: 
		case 7: 
		case 8: 
		case 10:  
		case 12:  res="31";
		     break;
		
		
		case 4: 
		case 6: 
		case 9: 
		case 11: res="30"; 
		    break;
		    
		case 2: res="29";
		     break;
		     default : res= "월 데이터가 아닙니다.";
		}
		System.out.println(month + "달의 일수는" + res);
		
		//static 굳이 객체를 생성하지 않아도 쓸수 있는 함수
		//난수(랜덤값 : 임의의 추출값)
		//https://docs.oracle.com/javase/8/docs/api/index.html
		//검색
		//java.lang.Math (Math 클래스)
		//Math.Random() 함수 : 호출에 의해서 실행
		//java 페이지에서 default 열어놓은 폴더가 있어요 (java.lang) 얘 오픈돼 있음 원래는  import java.lang.*
		//Math.random();
		//static : 객체를 생성하지 않아도 사용 가능한 함수
		// greater than or equal to 0.0 and less than 1.0. 
		//결과는 : double 실수 : 0.0 <= random < 1.0
		//kr.or.bit.Emp 원칙적으로
		System.out.println("Math.random() :" + Math.random()); //0.0563740393965485
		System.out.println("Math.random() * 10 :" + Math.random() * 10 ); //6.38027651547954
		//0~9까지의 정수만
		System.out.println("(int)(Math.random() * 10) :" + (int)(Math.random() * 10 )); //9
		//1~10까지의 정수만
		System.out.println("(int)(Math.random() * 10) :" + ((int)(Math.random() * 10 )+1 )); //10
		
		
		
		
		
/*		내가 만든 오답
		int data2;
		data2 = ((int)(Math.random() * 100 ));
		switch(data2) {
		case 1000 : System.out.println("TV, NoteBook , 냉장고, 한우세트 , 휴지");
		    break;
		case 900 : System.out.println("NoteBook , 냉장고, 한우세트 , 휴지");
		    break;
		case 800 : System.out.println("냉장고, 한우세트 , 휴지");
		    break;
		case 700 : System.out.println("한우세트 , 휴지");
	        break;
		case 600 : System.out.println("휴지");
            break;
		
		default : System.out.println("칫솔");	
		}
		System.out.println(data2);
*/
		int jumsu =  ((int)(Math.random()* 10) + 1)*100;  //random 한정된 범위 안의 랜덤뽑기라서 같은 수가 반복될수 있음
		System.out.println("추첨번호 : " + jumsu);
		String msg=""; //초기화
		msg+= "고객님의 점수는 :" + jumsu + " 이고 상품은 : ";
		switch(jumsu) {
		case 1000:msg+="Tv ";
		case 900:msg+="NoteBook ";
		case 800:msg+="냉장고 ";
		case 700:msg+="한우 ";
		case 600:msg+="휴지 ";
		       break;
		default:msg+="칫솔";
		}
		System.out.println(msg);
		
		
		

		
	}

}





