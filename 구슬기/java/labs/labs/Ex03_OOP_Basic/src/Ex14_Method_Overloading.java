/*
 * 
 OOP (��ü���� ���α׷���)
 1.��� (���뼺)
 2.ĸ��ȭ(����ȭ) : private : Ŭ�������ο����� ������ �ȵ����� ���������� �ٸ��ʿ����� �Ⱥ��δ�.  :�����Ҵ��� ���� �����Ҵ��� �Ѵ�. : setter ,getter (Ư���� �Լ�)
 3.������
 
 ������ �� �κ����� .....[�����ε�]
 
  >> method overloading     �����ε��� �������̵��� ��������?  �����ε��� �ϳ��� �̸����� �������� ����� �ϴ°� ex) ��Ÿũ����Ʈ �����ε�.
                   *��ü������ �����غ�����*                �Լ��� �̸��� �����ϴ�. �Ķ������ ������ Ÿ���� �޸��ϴ� ����Դϴ�.
                                                                                                            ����Ÿ���� ������ ���� �ʴ´�.
       [�������� ���ֹ���� �����̴�]                       �������̵��� ��Ӱ��� ����? ����?
                                                       
  >>�����ε��� �ϳ��� �̸����� �������� ����� �ϴ� �Լ� 
  //System.out.println �� �ٷ� ù�� ù�ð��� �� �����ε��� ���� �� �Լ��̴�.
  //println overloading 
   Ư¡ : �����ε��� ������� ������ �ش�( x)
              �׷� �־���?  ����ڸ� ���ϰ� �Ϸ���
              ���> �Լ��� Ȱ�� > �������� �Լ��� ���� (x) > �ϳ��� �Լ�(parameter �޸�)
    
  ���� : �Լ��̸��� ���� parameter �� [����]�� [Ÿ��]�� �޸��ϴ� ��� 
  1. �Լ��̸��� ���ƾ� �Ѵ�.
  2. [parameter]�� ���� �Ǵ� [Type]�� �޶�� �Ѵ�.
  3. return Type �����ε��� �Ǵܱ����� �ƴϴ�(x)
  3. parameter ������ �ٸ��� �����Ѵ�.                                                  
                                                       
                                                       
 �Լ������� ������� �����ε��� �Լ����� ������ �Ǵ��Ѵ�.
 
 */

class Human{
	String name;
	int age;
	
}


class OverTest{
	int add(int i) {
		return 100+i;
	}
	// �����̸��ε� �Ķ���� ������ Ÿ���� �޸��ϴ°� : �����ε�
	int add(int i,int j) {
		return i + j;
	}
	
	//String add(int k) {}  >> int add(int i) {} �����༮.
	String add(String s) { //parameter�� ������ ������ Ÿ���� �ٸ��� �����Ѵ�.
		return s +"hello";
	}
	
	void add(int i , String s) {
		System.out.println("�����ε�: "+ i + "/" + s);
	}
	void add(String s , int i) { //Ÿ���� ������ �ٸ��� �����Ѵ�.
		System.out.println("���� �����ε�: "+ s + "/"+ i);
	}
	void add(Human h) { //�����ε�
		h.name = "ȫ�浿";
		h.age = 20;
		System.out.println(h.name + "/" + h.age);
		
	}
	
	
	
	
}
public class Ex14_Method_Overloading {

	public static void main(String[] args) {
		OverTest ot = new OverTest();
		int result = ot.add(10,20);
		System.out.println(result);
		
		//ot.add(new Human());  ok
		Human h = new Human();
		ot.add(h);

	}

}
