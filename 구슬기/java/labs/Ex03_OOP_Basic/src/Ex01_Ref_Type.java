//import kr.or.bit.*; //�ȿ� Ŭ����200�� >>�������� �������Ե�. �Ѵ��� ���� Ŭ���� �����ߴ��� �˼��� ����.
//import kr.or.bit.a; aŬ���� ���
//import kr.or.bit.b; bŬ���� ����߱���? >> �ϳ��� ����ؼ� �������� ���δ�.
import kr.or.bit.Emp;
import kr.or.bit.Person;
import kr.or.bit.TV;
import kr.or.bit.Emp;
import kr.or.bit.BodyInfo;

public class Ex01_Ref_Type {

	public static void main(String[] args) {
		
		
		//�� Ÿ�� (������� : �޸𸮿� �����ִ�~)
		int i  = 100; //[�����Լ�]�ȿ��ִº����� �������� �ʱ�ȭ�� �ؾ���
		i = 200;
		System.out.println("i : " + i);
		
		//����Ÿ��
		Person person; //���� �Ѱ� �굵 ���������� >>stack ��� �޸� ������ ������ ���������.
		person = new Person(); //person ��� ������ ��(�ּҰ�) �� �Ҵ��ؾ���
		System.out.println(person); //kr.or.bit.Person@15db9742
		
		//�ʱⰪ �Ҵ�
		Person person2 = null; //null : ���� ����!����ִ�! ��ü�� �ʱⰪ���� ����.
		System.out.println(person2); //null : ������ �ִ� �� �޸𸮸� ������ ���� ����(new person2)�ϸ� ����
		
		// person2�� �޸𸮸� ���� �����?
		// 1. person2 = new Person();  // new ������
		// 2. person2 = person;        // ���� Ÿ���� �ּҸ� ������ �Ҵ�ȴ�.
        person2 = person;
        System.out.println(person2 == person); //true ��� ���� �ּ��� , �������� ��� ��
        
        person2.name ="ȫ�浿";
        person2.age = 100;
        person2.print(); //name : ȫ�浿/age : 100
        
        System.out.println(person.name);  //ȫ�浿   person2 = person�� ���༭ �������� ���´�.
        
        //����� �Ҵ��� ���ÿ� 
        Person myperson = new Person();  // ���� Ÿ�� = ������ Person();
        myperson.name = "�ƹ���";
        myperson.print(); //name : �ƹ���/age : 0
        System.out.println(myperson.power); //false  default ���� fasle �� ���´�.
        
        
        //Tv ����� ä�� 5���� �÷�������
        //Tv �귣��� ��Ʈ �ϰ� �ϼ���
        TV tv = new TV();
        tv.brandname = "��Ʈ";
        System.out.println("���� ä�� ����: "+tv.ch);
        
        tv.ch_Up();
        tv.ch_Up();
        tv.ch_Up();
        tv.ch_Up();
        tv.ch_Up();
        
        System.out.println("���� ä�� ����: "+ tv.ch);
        
        tv.ch_Down();
        tv.ch_Down();
        
        System.out.println("���� ä�� ����: "+ tv.ch);
        System.out.println("�귣�� �̸�: "+tv.brandname);
        tv.tvPrint();
        
        
        
        
        //��� �Ѹ��� �����غ���
        
        Emp emp = new Emp();
        emp.empno =7788; 
        emp.name = "������";
        emp.job= "IT";
        
        System.out.println(emp.bodyinfo); //null
        BodyInfo bodyinfo = new BodyInfo();
        emp.bodyinfo = bodyinfo; //�Ҵ�(�ּҰ� �Ҵ�)
        bodyinfo.height = 190;
        bodyinfo.weight = 90;
        
        System.out.println(emp + "/" + emp.bodyinfo); //emp.bodyinfo �� .�� ���� ������  �ּҰ� ������ �׾ȿ� ������ �����Ѵ�.
        System.out.println(emp.empno + "/" + emp.bodyinfo.weight);
        
        Emp e = new Emp();
        e.bodyinfo = new BodyInfo();
        
        
	}

}
