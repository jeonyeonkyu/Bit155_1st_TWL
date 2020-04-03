package Ex07_ETC;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

//https://cafe.naver.com/opensourceweb/441 참고

public class Ex10_Format_Date {
    public static void main(String[] args) throws ParseException {
        Date curdate = new Date();
        Calendar cal = Calendar.getInstance();
        System.out.println("Date : " + curdate); //format
        System.out.println("cal : " + cal);  //문자열 ...
        System.out.println("cal getTime()" + cal.getTime()); //format

        String StringDate = "202012121212";

        SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddHHmm");
        System.out.println(dateformat.format(curdate));
        System.out.println(dateformat.format(cal.getTime()));

        SimpleDateFormat dateformat2 = new SimpleDateFormat("yyyy년MM월dd일HH시mm분");
        System.out.println(dateformat2.format(curdate));
        System.out.println(dateformat2.format(cal.getTime()));

        //문자열(날짜형식맞게) --> 날짜 형식으로 변환
        Date stringdate =  dateformat.parse(StringDate);
        System.out.println("StringDate : " + StringDate);
        System.out.println("stringdate : " + stringdate);

        long datelong = stringdate.getTime();
        System.out.println(datelong);
    }
}
