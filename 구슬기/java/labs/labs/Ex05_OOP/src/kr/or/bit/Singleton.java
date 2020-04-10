package kr.or.bit;
//������ ����(��������) >> new >> ��ü�� ����� ���
//��ü �ϳ��� ���� ����.....�ϰڵ�.?
//ȸ�翡 ���� ����������, 


//�̱����� ���ؼ� ���� ���� ������ �ִ°�?
//��ü�� �ּҰ� �׻� �����ϴ�. >>  �ϳ��� ��ü�� �����ϰڴ�..   �������� ���� �������ν� �ϳ� �ʰ��ؼ� ����� ����.   


//Ȱ���� JDBC���� �Ѵ�.  JDBC��?  JAVA�ϰ�  DB������ �������̽� ������ �ϴ°�.  JAVA <- (JDBC:CRUD)  -> DB

//p��� ������ �޸𸮿� �ø��� p��� ������ null���̸� ��ü�� �޸𸮿� �ø���. 

//main
//Singleton singleton = new Singleton() //��ü�� ���鶧 �� �ڿ� �����ڸ� ȣ���ؼ� �����.  >>����(private) 

public class Singleton {
	private static Singleton p; //���Ҵµ� �޸𸮿� �ö󰡴µ�??  �޸𸮿� �ö󰡵� private �̶� ���� ����. 
	
	
	private Singleton() { //������(default)  //������ü�����Ұ�..
		
	}
	
	public static Singleton getInstance() {
		if(p == null) { //÷�� �翬�� null����
			p = new Singleton(); //singleton = new Singleton();
			                     //class Ŭ���� ���ο����� public, private �������� �ʾƿ�!
		}
		return p;
	}

}
