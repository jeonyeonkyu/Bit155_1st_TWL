/*
 ������ �Լ�(constructor)
 1.�Լ�(Ư���� ����) 
 2.Ư���� ���� (member field�ʱ�ȭ)
 
 Tip) static{}, {}
 
 3.�Ϲ��Լ��� �ٸ���
 3.1 �Լ��� �̸��� �����Ǿ����� (class �̸��� ����)
 3.2 ������� ������ : return Type (x) >> void �� ������ ����  >> ������ void �� . ������� �ʾƵ� default void �� ����
 3.3 ������� : ��ü����(new) �ǰ� ������ ����� ���� ""�ڵ�""���� ȣ��Ǵ� �Լ�(�ҷ���� ȣ��Ǵ� �⺻�Լ��� �ٸ��� �����ϰ� �ڵ����� ȣ���) >> ������ �Լ�
 
 4. ����: �����Ǵ� ��ü���� ���������� �ٸ� member field ����(�ʱⰪ) �ο��ϴ� ���
 class Car{String color;}
 >>Car c = new Car(); �̻���� ���� ���鶧 ������ ������ ������ ������ ���ڴµ� ����� ������? �װ� �ٷ� ������!!
 
 5.�����ڵ� �Լ���! >> overloading ����
 
------ ****����� ���� overloading  �� ������ �Լ��� �ϳ��� �����ߴٸ� default ������ �Լ��� �ݵ�� ������ ���ؼ��� �����ȴ�.!!!!
        �� ������? 
 
 
 */
//�������� �ǵ�: �ڵ����� ����� �ݵ�� �ڵ��� �̸��� �־��.
class Car{
	String carname;
	//�����Ǿ� �־���....�Ҹ�..
	//���� �ڵ����� ������ �����Ϸ��� �ڵ����� �ڵ带 �ϳ� �����. �װ���
	Car(){}
}

class Car2{
	String carname;
	Car2(){ //void �� �����Ǿ��ִ�.  default void
		System.out.println("���� default �������Դϴ�.(�ڵ�ȣ��)");
		carname = "����"; //������ member field �� �ʱⰪ....
	}
}

class Car4{
	int door;
	int wheel;
	
//	������ �����ε� : �������� �ʱ�ȭ. �����Ҷ� ���������� �ɼ��� �־����.
//	Car4(){
//		System.out.println("default");
//	}
//	 //method overloading (�Լ�)
//	 //�����ε�
//	Car4(int num){
//		door =  num;
//		System.out.println("overloading door : "+ door);
//		
//	}
//	Car4(int num, int num2){
//		door = num;
//		wheel = num2;
//		System.out.println("overloading door : "+ door + "/" + wheel);
//	}
}


public class Ex16_Constructor_overloading {

	public static void main(String[] args) {
		//Car c1 =new Car();
		//c1.carname = "�ҳ�Ÿ";    �̸� �ִ� ���� �������� �ʴ´�. ���� ���� ���� ����
		//Car2 c2 =  new Car2(); //Car2(); ������ �Լ��� ȣ���ϴ� �Ŵ�.
		//System.out.println(c2.carname);
		
		//��Ģ�����δ� ��ü�� �����Ҷ� �������Լ��� 1���� ȣ��
		Car4 c4 = new Car4();         //default����
		//Car4 c4 = new Car4(100);    //overloading door : 100
		//Car4 c4 = new Car4(10,200);  // overloading door : 10/200

		//**�ڵ��� �ֹ�����**
		//Case
		//Case �⺻�ڵ���. 
		//Case1 �ڵ�������
		//Case2 �ڵ��� ����, ����
		//Case3 �ڵ������� , ����, �׺�����  
		
		//������ overloading Ȱ��(������)
		
		
		
		
		
		
		//�ó������� ������....
		
		
		
		
		
		
		
		
		
		
	}

}
