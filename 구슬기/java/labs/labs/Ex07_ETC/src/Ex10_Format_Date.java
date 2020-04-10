import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

//https://cafe.naver.com/opensourceweb/441 참고
public class Ex10_Format_Date {
	public static void main(String[] args) throws ParseException {  //여기에 예외를 던졌는데 try/catch해야함.
		Date curdate = new Date();
		Calendar cal = Calendar.getInstance();
		System.out.println("Date : "+ curdate); //Date : Thu Mar 19 10:50:01 KST 2020  //format
		System.out.println("cal : "+ cal); //문자열...이라서 Formating 이 안된다.
		System.out.println("cal getTime()"+cal.getTime()); //cal getTime()Thu Mar 19 10:50:01 KST 2020
		
		String StringDate = "202012121212";
		
		
		
		//simpleDateFormat   그레고리안 날짜를 내가 원하는 형식으로 포맷 할 수 있다.
		//앞의 방식보다 훨씬 편리한듯? 
		
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddHHmm");
		System.out.println(dateformat.format(curdate)); //202003191053
		System.out.println(dateformat.format(cal.getTime()));//202003191053
		
		SimpleDateFormat dateformat2 = new SimpleDateFormat("yyyy년MM월dd일HH시mm분");
		System.out.println(dateformat2.format(curdate)); //2020년03월19일10시54분
		System.out.println(dateformat2.format(cal.getTime()));//2020년03월19일10시54분 
		
		
		//문자열(날짜형식맞게) --> 날짜형식으로 바꿀 수 있다.    이거 편하다고 하심
		Date stringdate = dateformat.parse(StringDate);
		System.out.println("StringDate : "+ StringDate);  //StringDate : 202012121212
		System.out.println("stringdate : "+ stringdate);  //stringdate : Sat Dec 12 12:12:00 KST 2020
		
		
		long datelong = stringdate.getTime();
		System.out.println(datelong); //1607742720000
		
		
	}

}
