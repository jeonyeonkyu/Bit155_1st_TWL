/*
 ���� <-> ���
 ��� : �ѹ� ���� �ʱ�ȭ�Ǹ� ����Ұ�����
 ����ڿ�: ������(ex�ֹι�ȣ), �������� �� : pi=3.14159...
 ����� ���������� [�빮��]�� ����. 
 
 java : final int NUM =10;
 C#   : const int NUM =10;
 
 final Ű����
 Ŭ���� �տ� >> final class Car{} >> final Math >> ��ӺҰ�
 �Լ� �տ� :public final void print(){} >>��� >> ������ ������ .
         public static final void print(){}
��� :public final String KIND="heart" //���         
 
 */
class Vcard{
	final String KIND="heart"; //�ѹ� �ʱ�ȭȭ �� ���� ���� �Ұ��� �ϴ�
	final int NUM=10;
	
	void method() {
		//�ڹ� API �ý��� ��� 
		System.out.println(Math.PI);
	}
}
//Vcard ī�� 53 ���� ����� ...��� ī�� ��� >>KIND >> heart
//Ȥ�� 53���� ī�� KIND �� �ٸ���... �Ҽ�������? ��������� �ٲ��� �ʰ� �����ʹ�.

class Vcard2{
	final String KIND;//����� �ʱ�ȭ�� �����ϴµ� �ʱ�ȭ�� �����Ѵٸ� �����ϰ� �Ʒ� �����ڿ��� �����Ҽ��ִ�. �̷����ϸ� ��������� ��ü���� �ٸ��� ������ �ѹ����ϸ� �ٲ��� �ʾƵ��ȴ�.
	final int NUM;
/*	
      Vcard2(){
		this.KIND ="heart";
		this.NUM =10;
	}
*/
	//Vcard2(){}
	Vcard2(String kind , int num){
		this.KIND=kind;
		this.NUM =num;
	}
	@Override
	public String toString() {
		return "Vcard2 [KIND=" + KIND + ", NUM=" + NUM + "]";
	}
	
}



public class Ex07_Inherit_Final {

	public static void main(String[] args) {
		//Vcard v = new Vcard();
		//v.method();
		//v.NUM=1000; //The final field Vcard.NUM cannot be assigned.
		
		Vcard2 c = new Vcard2("spade",1);
		System.out.println(c.toString());
		Vcard2 c2 = new Vcard2("spade",2);
		System.out.println(c2.toString());
		Vcard2 c3 = new Vcard2("spade",3);
		System.out.println(c3.toString());
		
		
		
		//c.KIND = "heart"; //�ѹ� �ʱ�ȭ �� ���� ������ �Ұ����ϴ� (���)

	}

}
