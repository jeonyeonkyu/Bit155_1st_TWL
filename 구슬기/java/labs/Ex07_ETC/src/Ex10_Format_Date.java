import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

//https://cafe.naver.com/opensourceweb/441 ����
public class Ex10_Format_Date {
	public static void main(String[] args) throws ParseException {  //���⿡ ���ܸ� �����µ� try/catch�ؾ���.
		Date curdate = new Date();
		Calendar cal = Calendar.getInstance();
		System.out.println("Date : "+ curdate); //Date : Thu Mar 19 10:50:01 KST 2020  //format
		System.out.println("cal : "+ cal); //���ڿ�...�̶� Formating �� �ȵȴ�.
		System.out.println("cal getTime()"+cal.getTime()); //cal getTime()Thu Mar 19 10:50:01 KST 2020
		
		String StringDate = "202012121212";
		
		
		
		//simpleDateFormat   �׷����� ��¥�� ���� ���ϴ� �������� ���� �� �� �ִ�.
		//���� ��ĺ��� �ξ� ���ѵ�? 
		
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddHHmm");
		System.out.println(dateformat.format(curdate)); //202003191053
		System.out.println(dateformat.format(cal.getTime()));//202003191053
		
		SimpleDateFormat dateformat2 = new SimpleDateFormat("yyyy��MM��dd��HH��mm��");
		System.out.println(dateformat2.format(curdate)); //2020��03��19��10��54��
		System.out.println(dateformat2.format(cal.getTime()));//2020��03��19��10��54�� 
		
		
		//���ڿ�(��¥���ĸ°�) --> ��¥�������� �ٲ� �� �ִ�.    �̰� ���ϴٰ� �Ͻ�
		Date stringdate = dateformat.parse(StringDate);
		System.out.println("StringDate : "+ StringDate);  //StringDate : 202012121212
		System.out.println("stringdate : "+ stringdate);  //stringdate : Sat Dec 12 12:12:00 KST 2020
		
		
		long datelong = stringdate.getTime();
		System.out.println(datelong); //1607742720000
		
		
	}

}
