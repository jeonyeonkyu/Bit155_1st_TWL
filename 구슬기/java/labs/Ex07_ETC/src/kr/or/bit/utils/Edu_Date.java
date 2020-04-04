package kr.or.bit.utils;

import java.util.Calendar;

//설계도
//사용자 편하게쓸것이냐를 고민..
//많이 사용할까?....static으로 하면 좋음. 많이쓰니까!
//유지보수(함수이름)....
//다형성..

public class Edu_Date {
	public static String DateString(Calendar date) {
		return date.get(Calendar.YEAR)+ "년" +
				(date.get(Calendar.MONTH)+1)+ "월" +
				date.get(Calendar.DATE)+ "일";
	}
	public static String DateString(Calendar date,String opr) {
		return date.get(Calendar.YEAR)+ opr +
				(date.get(Calendar.MONTH)+1)+ opr +
				date.get(Calendar.DATE);
	}
	//요구사항
			//2020-3-19
			//1월~9월까지는 >> 01, 02, 03 ,04, 05, 06, 07, 08, 09  
			//10월~12월 >> 그냥
			public static String monthFormat_DateString(Calendar date) {
				
				String month="";
						if((date.get(Calendar.MONTH)+1)<10) {
							month ="0"+ (date.get(Calendar.MONTH)+1);
						}else {
							month =String.valueOf((date.get(Calendar.MONTH)+1));
						}
						return date.get(Calendar.YEAR)+"년"+month+"월"+date.get(Calendar.DATE)+ "일";
							
			}

}
