package kr.or.bit.utils;

import java.util.Calendar;

//���赵
//����� ���ϰԾ����̳ĸ� ���..
//���� ����ұ�?....static���� �ϸ� ����. ���̾��ϱ�!
//��������(�Լ��̸�)....
//������..

public class Edu_Date {
	public static String DateString(Calendar date) {
		return date.get(Calendar.YEAR)+ "��" +
				(date.get(Calendar.MONTH)+1)+ "��" +
				date.get(Calendar.DATE)+ "��";
	}
	public static String DateString(Calendar date,String opr) {
		return date.get(Calendar.YEAR)+ opr +
				(date.get(Calendar.MONTH)+1)+ opr +
				date.get(Calendar.DATE);
	}
	//�䱸����
			//2020-3-19
			//1��~9�������� >> 01, 02, 03 ,04, 05, 06, 07, 08, 09  
			//10��~12�� >> �׳�
			public static String monthFormat_DateString(Calendar date) {
				
				String month="";
						if((date.get(Calendar.MONTH)+1)<10) {
							month ="0"+ (date.get(Calendar.MONTH)+1);
						}else {
							month =String.valueOf((date.get(Calendar.MONTH)+1));
						}
						return date.get(Calendar.YEAR)+"��"+month+"��"+date.get(Calendar.DATE)+ "��";
							
			}

}
