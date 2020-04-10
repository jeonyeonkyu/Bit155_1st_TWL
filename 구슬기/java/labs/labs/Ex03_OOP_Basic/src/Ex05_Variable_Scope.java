/*
 **instance variable >> class Car {public String color;}
 **local variable >> class Car {public void move (){int speed}}
 main �Լ� �ȿ� �ִ� ��� ������ :local variable >>�ʱ�ȭ �ؾ��ϴ� ��
 static variable >>�����ڿ�(��ü��),,��ü���� ������ memory�� �ö󰡴� �ڿ�
 */
class Variable{
	int iv;
	/*
	 1. member field , instance variable 
	 2. Variable v = new Variable(); heap�޸𸮿� iv ����
	    Variable v2 = new Variable(); heap �޸𸮿� iv �� ����...
	 3. �긦 ����� ���� : ������ �������� ��(������ �´� Type�� �����������)
	    -����(�Ӽ�) >> �������� , �������� , ��ǰ����(����)
	    -������ �����Ǵ� ��ü���� �ٸ� ���� ���� �� �ִ�. ex)Variable �� 20-30���� �Ǿ����� iv �� ���� �� �ٸ��� �Ҽ��ִ�.
	    -�׷��� ������ ���� �ʱ�ȭ�� ���� �ʴ´�. 
	    -�⺻������ default ��: int>> 0, float >> o.o , boolean >> false, String >> null, ����Ÿ�� >> null
	 4. �������� : new ��� �����ڸ� ���ؼ� heap�� ��ü�� ��������� ���� �ٷ� ������ �����˴ϴ�. Variable ����� iv ���� ����.   
	 */
	
	static int cv;
	/*
	 1. class Variable (Ŭ���� ����), static variable(����(��ü��) ����)
	 2. ���� : ������ ��� ��  *****¯ �߿���. (�����Ǵ� ��� ��ü�� �����ϴ� �ڿ�) �׷���! ��ü�� �����ڿ�
	    heap �̶�� �ϴ� ������ ������ ��ü���� �����ڿ�(�����ڿ�)
	 3. Ư¡ : ���ٹ���� ��Ư�ϴ� >> Ŭ�����̸�.static������ (��ü�� ����� ���� ���� ��Ȳ������ ������ ����)
	    ex) Math.Random() >> ����ϱ� ���ؼ�>> Math m = new Math() >> m.Randaom() �� ���� ����
	               ���� ��� >> ������ �͵� �ƴϱ⿡ >> ��������.static������     ���ε� ���ٰ����� 
	    ex) Variable v = new Variable();
	        Variable v2 = new Variable();
	        1.variable.cv Ŭ���� �̸����� ����
	        2.v.cv        �����ּҷ� ����
	        3.v2.cv       �̷��� ������ ������� ���ٰ���
	  
	  
	  
	  
	       class Hello {public static void main(String[] args){ syso...}}
	  4.  �������� : Hello.java > javac Hello.java > Hello.class
	              >java.exe Hello ���� ����..
	              >class loader System �� ���ؼ�
	                            Ŭ������ ����(metadata :���� (�� �ؼ��ϴ¾��)) class area(method area) �÷���
	              -- �� Ŭ������ ���� ������� � �ڿ��� import �ϰ� �ְ�     ���� ���...�̷��͵��� ����ϴ� ��.
	              -- �� Ŭ���� �ȿ� static variable �Ǵ� static method �� ������
	              --�� �༮�� memory(class ==method area)�� �÷� ���´�.
	              �м��ϰ� �ø��ٰ� static variable �Ǵ� static method �� ������ �̳༮�� class memory �� �ø���.
	                       
	 */
	void method() {
		int lv = 0;
		/*
		  local variable (�Լ� �ȿ� �ִ� �������� : ������� �ݵ�� �ʱ�ȭ�� �ؾ���)
		  �����ֱ�: �Լ��� ȣ��Ǹ� �����Ǿ��ٰ� �Լ��� ������ ���� �״´�. ������ü
		  *�Լ� �ȿ��� ��� 
		  for(int i ....)>> i ������ for�� ����Ǹ� ����... for �� ������ �Ҹ�
		  --�̷��� ��������� ��.
		 */
	}
}


public class Ex05_Variable_Scope {

	public static void main(String[] args) {
		Variable.cv = 100;
		Variable v = new Variable();
	

	}

}
