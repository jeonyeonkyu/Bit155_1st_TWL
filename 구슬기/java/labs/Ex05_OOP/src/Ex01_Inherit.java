/*
 OOP Ư¡
 
 1. ���
 2. ĸ��ȭ(����ȭ)
 3. ������(����...���� �긦 �� �߱���)
 
 1. ���ǥ��
 java : child extends Base(child�� Base�� Ȯ���մϴ�.)
 C#   : child : Base 
 
 2. ��� Ư¡
 2.1 ���� ����� �Ұ��� !  �̰� ���Ҹ���. ���������� ������~ ex)�Ҿƹ��� ->��, �ƹ���->��
 2.2 ���� ���(������ �������: ���ؼ� �������� Ŭ������ ��� �մϴ�.) ex) �Ҿƹ��� -> �ƹ��� -> ��
 2.3 ���߻���� �����ϴ°� ���� (������ �ڿ� :Interface) �ڹٿ����� �����ϴ�!
 
 3. ��� �ǹ�
 3.1 ������ �ǹ� (����): ���뼺     //�ٸ� ������ ������ ���ϴ�. ������ ���� ���������ʴ´�.
 3.1 ���� : �ʱ� ���(����)
 ���뼺 >> ���� >> ���(�ð�, �����ڿ�(�и�,�߻�ȭ))

 4. ��Ӱ��迡�� Memory �� ���½�������?
    �ֻ��� �ڿ��� Object -> GrandFather -> Father -> Child ������ �ö󰣴�.
  ����ڰ� ����� ��� Ŭ������ default  �� Object Ŭ���� ���..
  class Car{} >>���������δ� >> class Car extends Object{}
  Object ��� Ŭ���� root (�ֻ���) : ��� Ŭ������ �θ� Ŭ�����̴�.
 
 
 
  
 
 */
class Car{}
class GrandFather{ //GrandFather extends Object �̰� �����ȰŴ�
	public GrandFather() {
		System.out.println("GrandFather");
	}
	public int gmoney=5000;
	private int pmoney=10000; //private ��Ӱ��迡���� � �ǹ� �ϱ� : ���ٺҰ���(��ȣ�ϴ°Ŵ�)  : ���ο��� Ȱ��
}
class Father extends GrandFather{  //�ƹ����� �Ҿƹ����� �ڿ��� ��� �޽��ϴ�.
	public Father() {
		System.out.println("Father");
	}
	public int fmoney=1000;
}
class Child extends Father{
	public Child() {
		System.out.println("Child");
	}
	public int cmoney=500;
}
public class Ex01_Inherit {

	public static void main(String[] args) {
		Child ch = new Child();  //child father grandfather �� heap �޸𸮿� �����ȴ�. �׷��� ->�� ->���ϵ� ������ �ö󰣴�.
		System.out.println(ch.gmoney);  //�� ��� �����ϴ�.  //�Ҿƹ��� ���� ����
		System.out.println(ch.fmoney);  //�ƹ��� ���� ����
		System.out.println(ch.cmoney);  //������ ���� 
		//System.out.println(ch.pmoney); �Ҿƹ��� Ŭ���������� �����̺����� �س��⶧���� ��������.!!!!!!!!!!
		Car c = new Car();
		

	}

}
