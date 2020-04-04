import java.util.Calendar;
import java.util.Date;

import kr.or.bit.utils.Edu_Date;

/*
* Calendar 를 상속받아 완전히 구현한 클래스는 
 * GregorianCalendar
   buddhisCalendar 있는데 getInstance()는 [시스템의 국가와 지역설정]을 [확인]해서
      태국인 경우 buddhisCalendar 의 인스턴스를 반환하고 그 외에는 GregorianCalendar
     의 인스턴스를 반환한다
   GregorianCalendar 는 Calendar를 상속받아 오늘날 전세계 공통으로 사용하고 있는 
   그레고리력에 맞게 구현한 것으로 태국을 제외한 나머지 국가에서는 GregorianCalendar 사용
   그래서 인스턴스를 직접 생성해서 사용하지 않고 메서드를 통해서 인스턴스를 반환받게하는
   이유는 최소의 변경으로 프로그램 동작을 하도록 하기 위함
   
   class MyApp{
     static void main(){
      Calendar cal = new GregorianCalendar();
      다른 종류의 역법의 사용하는 국가에서 실행하면 변경......    }  }
   
   
   class MyApp{
     static void main(){
      Calendar cal = new getInstance();
        다른 종류의 역법의 사용하는 국가에서 실행하면 변경......   }  }
  API : 생성자 Protected Calendar() 
 */
//Java API
//날짜 : Date (구) -> Calendar(신)


public class Ex09_calendar {
	public static void main(String[] args) {
		Date dt = new Date();      //java.util 꺼 써야함 //구버전
		System.out.println(dt.toString());  //     /선 그어진애들은 앞으로 없어질 애들이다. 
		
		//신버전
		Calendar cal = Calendar.getInstance();  //new GregorianCalendar();
		System.out.println(cal.toString());  //필요한값을 뽑아낼수있게 해놨음
		
		//당신이 필요한 형식을 추출해서 조합해서 사용하면 됨
		System.out.println("년도: " +cal.get(Calendar.YEAR));       //Calendar. 해서 나오는거는 다 상수다.
		System.out.println("월(0~11): " +cal.get(Calendar.MONTH));  //2가 나온다.  우리나라는 +1 해줘야함.
		System.out.println("월: " +(cal.get(Calendar.MONTH)+1)); 
		System.out.println("일: " +cal.get(Calendar.DATE)); 
		
		System.out.println("이 달의 몇째 주: " +cal.get(Calendar.WEEK_OF_MONTH)); 
		System.out.println(" " +cal.get(Calendar.DAY_OF_MONTH));
		System.out.println(" " +cal.get(Calendar.DAY_OF_WEEK)); // 일요일이 시작점 이라서 5가 나옴.  일월화수목

		//시, 분 , 초
		//오전 , 오후
		System.out.println("시: " +cal.get(Calendar.HOUR)); 
		System.out.println("분: " +cal.get(Calendar.MINUTE)); 
		System.out.println("초: " +cal.get(Calendar.SECOND));    //내 컴퓨터의 시간이 나온다.
		
		System.out.println("오전오후: " +cal.get(Calendar.AM_PM)); //0이면 오전   1이면 오후 인가봄
		
		
		/*
		 
		학사관리 시스템
		
		본수 200Page >> 150Page 날짜가  들어가야함
		1Page >> 2020-03-19
		2Page >> 2020-03-19    이렇게 하면 무식하다고함..
		
		>>요구사항: 2020년03월19일       >>   150번 수정해야됨. 안좋은 방법
		>>한번수정>> 150개의 page 날짜 변경
		>>날짜 관련된 클래스 >> 함수  > 함수를 150 page 호출해서 쓴다..
		>>class EduDate{static String todate(){캘린더,,날짜 생성리턴}}
		>>1Page >> EduDate.todate() >>출력
		요구사항이 바뀌면 이것만 바꾸면된다.
		
		
		 */
		
		String date = Edu_Date.DateString(Calendar.getInstance());   //2020년12월19일
		System.out.println(date);
		
		String date2 = Edu_Date.DateString(Calendar.getInstance(),":"); //2020:12:19
		System.out.println(date2);
		
		String date3 = Edu_Date.DateString(Calendar.getInstance(),"/"); //2020/12/19
		System.out.println(date3);
		
		
		//요구사항  1~9월까지는 0붙여서 나오는것
		String date4 = Edu_Date.monthFormat_DateString(Calendar.getInstance()); //2020년03월19일
		System.out.println(date4);
		

		
	}

}
