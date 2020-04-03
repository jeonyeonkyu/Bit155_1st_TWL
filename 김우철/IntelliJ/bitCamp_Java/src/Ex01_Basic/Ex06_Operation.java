package Ex01_Basic;

public class Ex06_Operation {
    public static void main(String[] args) {

        int data =50;
        switch(data) {
            case 100 : System.out.println("100입니다");
                break;
            case 90  : System.out.println("90입니다");
                break;
            case 80  : System.out.println("80입니다");
                break;
            default  : System.out.println("default");
        }

        //break 강제 사항 입니까 .... (필요에 따라서 사용하세요)
        //break 조건 만족하는 그 이후부터 모두 실행
        data =80;
        switch(data) {
            case 100 : System.out.println("100입니다");
            case 90  : System.out.println("90입니다");
            case 80  : System.out.println("80입니다");
            default  : System.out.println("default");
        }

        int month = 2;
        String res ="";
        switch(month) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12: res="31";
                break;
            case 4:
            case 6:
            case 9:
            case 11: res="30";
                break;
            case 2: res="29";
                break;
            default : res="월 데이터가 아닙니다";
        }
        System.out.println(month + "달의 일수는" + res);

        //난수 (랜덤값 : 임의의 추출값)
        //https://docs.oracle.com/javase/8/docs/api/index.html
        //검색
        //java.lang.Math  (Math 클래스)
        //Math.Random() 함수 : 호출에 의해서 실행
        //java 페이지에서 default 열어놓은 폴더가 있어요 (java.lang) >>
        //생략 >> import java.lang.*
        //Math.random();
        //static : 객체 생성하지 않아도 사용 가능 (함수)
        // greater than or equal to 0.0 and less than 1.0
        //결과 : double 실수 :  0.0 <= random < 1.0
        //kr.or.bit.Emp 원칙적으로
        System.out.println("Math.random() : " + Math.random());
        System.out.println("Math.random() * 10 : " + Math.random() * 10);
        //0~9까지의 정수만
        System.out.println("(int)(Math.random() * 10) : " + (int)(Math.random() * 10));
        //1~10까지의 정수만
        System.out.println("(int)(Math.random() * 10) : " + ((int)(Math.random() * 10)+1));

		/*
		문제를 풀어 보세요
		--3분 또는 2분이 같이 풀어보세요
		--문제를 푸시면 지금까지 배운 것 이해 하고 있으신 거죠
		우리는 백화점 경품 시스템을 만들려고 한다
		경품 시스템은 나오는 점수에 따라 경품을 지급하는 시스템이다
		경품 추첨시 1000 점수가 나오면
		경품으로 TV , NoteBook , 냉장고 , 한우세트 , 휴지
		경품 추첨시 900 점수가 나오면
		경품으로  NoteBook , 냉장고 , 한우세트 , 휴지
		경품 추첨시 800 점수가 나오면
		경품으로  냉장고 , 한우세트 , 휴지
		경품 추첨시 700 점수가 나오면
		경품으로  한우세트 , 휴지
		경품 추첨시 600 점수가 나오면
		경품으로  휴지
		그외 점수는 100 ~ 500 까지는 칫솔
		경품시스템의 점수 범위는 100 ~ 1000 점까지 한정되어 있다
		사용자가 경품 시스템을 사용시 랜덤하게 100 ~ 1000까지의 값이 나오게 되어 있습니다.

		*/
        int jumsu = ((int)(Math.random()* 10) + 1)*100;
        System.out.println("추첨번호 : " + jumsu);
        String msg="";//초기화
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


        String m = "F";
        String r ="";
        switch(m) {
            case "A":
            case "B":
            case "C":
            case "D":
            case "F":
            case "G": r="OK";
                break;
            case "H":
            case "K": r="NO";
                break;
            default : r="데이터가 아닙니다";
        }
        System.out.println(m + "달의 일수는" + r);
    }

}







