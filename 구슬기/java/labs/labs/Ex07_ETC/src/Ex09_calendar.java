import java.util.Calendar;
import java.util.Date;

import kr.or.bit.utils.Edu_Date;

/*
* Calendar �� ��ӹ޾� ������ ������ Ŭ������ 
 * GregorianCalendar
   buddhisCalendar �ִµ� getInstance()�� [�ý����� ������ ��������]�� [Ȯ��]�ؼ�
      �±��� ��� buddhisCalendar �� �ν��Ͻ��� ��ȯ�ϰ� �� �ܿ��� GregorianCalendar
     �� �ν��Ͻ��� ��ȯ�Ѵ�
   GregorianCalendar �� Calendar�� ��ӹ޾� ���ó� ������ �������� ����ϰ� �ִ� 
   �׷����¿� �°� ������ ������ �±��� ������ ������ ���������� GregorianCalendar ���
   �׷��� �ν��Ͻ��� ���� �����ؼ� ������� �ʰ� �޼��带 ���ؼ� �ν��Ͻ��� ��ȯ�ް��ϴ�
   ������ �ּ��� �������� ���α׷� ������ �ϵ��� �ϱ� ����
   
   class MyApp{
     static void main(){
      Calendar cal = new GregorianCalendar();
      �ٸ� ������ ������ ����ϴ� �������� �����ϸ� ����......    }  }
   
   
   class MyApp{
     static void main(){
      Calendar cal = new getInstance();
        �ٸ� ������ ������ ����ϴ� �������� �����ϸ� ����......   }  }
  API : ������ Protected Calendar() 
 */
//Java API
//��¥ : Date (��) -> Calendar(��)


public class Ex09_calendar {
	public static void main(String[] args) {
		Date dt = new Date();      //java.util �� ����� //������
		System.out.println(dt.toString());  //     /�� �׾����ֵ��� ������ ������ �ֵ��̴�. 
		
		//�Ź���
		Calendar cal = Calendar.getInstance();  //new GregorianCalendar();
		System.out.println(cal.toString());  //�ʿ��Ѱ��� �̾Ƴ����ְ� �س���
		
		//����� �ʿ��� ������ �����ؼ� �����ؼ� ����ϸ� ��
		System.out.println("�⵵: " +cal.get(Calendar.YEAR));       //Calendar. �ؼ� �����°Ŵ� �� �����.
		System.out.println("��(0~11): " +cal.get(Calendar.MONTH));  //2�� ���´�.  �츮����� +1 �������.
		System.out.println("��: " +(cal.get(Calendar.MONTH)+1)); 
		System.out.println("��: " +cal.get(Calendar.DATE)); 
		
		System.out.println("�� ���� ��° ��: " +cal.get(Calendar.WEEK_OF_MONTH)); 
		System.out.println(" " +cal.get(Calendar.DAY_OF_MONTH));
		System.out.println(" " +cal.get(Calendar.DAY_OF_WEEK)); // �Ͽ����� ������ �̶� 5�� ����.  �Ͽ�ȭ����

		//��, �� , ��
		//���� , ����
		System.out.println("��: " +cal.get(Calendar.HOUR)); 
		System.out.println("��: " +cal.get(Calendar.MINUTE)); 
		System.out.println("��: " +cal.get(Calendar.SECOND));    //�� ��ǻ���� �ð��� ���´�.
		
		System.out.println("��������: " +cal.get(Calendar.AM_PM)); //0�̸� ����   1�̸� ���� �ΰ���
		
		
		/*
		 
		�л���� �ý���
		
		���� 200Page >> 150Page ��¥��  ������
		1Page >> 2020-03-19
		2Page >> 2020-03-19    �̷��� �ϸ� �����ϴٰ���..
		
		>>�䱸����: 2020��03��19��       >>   150�� �����ؾߵ�. ������ ���
		>>�ѹ�����>> 150���� page ��¥ ����
		>>��¥ ���õ� Ŭ���� >> �Լ�  > �Լ��� 150 page ȣ���ؼ� ����..
		>>class EduDate{static String todate(){Ķ����,,��¥ ��������}}
		>>1Page >> EduDate.todate() >>���
		�䱸������ �ٲ�� �̰͸� �ٲٸ�ȴ�.
		
		
		 */
		
		String date = Edu_Date.DateString(Calendar.getInstance());   //2020��12��19��
		System.out.println(date);
		
		String date2 = Edu_Date.DateString(Calendar.getInstance(),":"); //2020:12:19
		System.out.println(date2);
		
		String date3 = Edu_Date.DateString(Calendar.getInstance(),"/"); //2020/12/19
		System.out.println(date3);
		
		
		//�䱸����  1~9�������� 0�ٿ��� �����°�
		String date4 = Edu_Date.monthFormat_DateString(Calendar.getInstance()); //2020��03��19��
		System.out.println(date4);
		

		
	}

}
