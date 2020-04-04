/*
1. Ex02_Variable Ŭ���� >> ���赵
2. static void main(String[] args) �Լ��� ������ �ִ� Ŭ���� : ���α׷��� ������, ������
*Ŭ������ ������ 2����
-class Test { static void main(String[] args){}}
-class Test {} �������� ���� (x) : main �� ���� Ŭ���� : �ٸ� Ŭ������ �����ִ� Ŭ����(lib)

Tip)
C# > public static void Main()...
������ ���� C# .... 70% ���ذ� �ȴ� ... C#�̶� �ڹٴ� ��ü�������.

 ���� : variable
 �����͸� ���� �� �ִ� ������ �̸�
 ������ Ÿ��(������ ũ��)>> �ڷ��� >> ������Ÿ���� ������
������ Ÿ�� ������; int i = 100;  i = 200;  ���� ��� �ٲ�� ���� �� �ִ�.

������ ����Ǵ� ��ġ (scope : ��ȿ����)
1. instance variable : ��ü���� >> class Person {int age}
2. local variable : ��������  (�Լ� �ȿ� �ִ� ����) class Person { public void run() { int speed }}
3. �Լ��ȿ� if ��, for �� �ȿ� �ִ� ������ �������� ���ȿ��� ��ȿ
4. static variable : ��������(�ڿ�) : ��ü�� �����ڿ�

�ϳ��� �ڹ������� ��������Ŭ������ ������ �մµ�
���������� �׷��� �� ���� �ʴ´�.
���赵�� �����ϸ� ����.
*/

//class�� ���赵�̴� == class Type �̴� (�������� ���� Ÿ���� ������ �ִ� ū Ÿ���̴�.)
class Test{
    int iv = 500; //instance variable,Ŭ�����ȿ��� �ٻ�밡��
    // �� ������ �ʱ�ȭ ���� �ʾƵ� �ȴ� ( �⺻�� : default)
    int window; //default => 0
    //�ʱ�ȭ : ó�� ���� ���� ��(�Ҵ��� ���ؼ�)
    //why : �ʱ�ȭ�� ���� �ʾƵ� ��� ���� �ұ�� (window ���� )
    //(hint) : ���赵�� �ϳ�..���赵�� ������� ����Ʈ�� ����������������, ���� ����Ʈ���� â���� ������ �ٸ� �� ����
    //��)��ü(����Ʈ)���� �ٸ� ���� ���� �� �ִ�...
    
    Test(){ //�Լ� >> �Լ��� �̸��� Ŭ���� �̸��� ���� �Լ��� : ������(constructor : �ʱ���)
    	    //�ڵ����� �Լ� ȣ�� : ���� : ����Ʈ�� �������� = ��ü�� ������ ���ÿ� 
    }
    
    Test(int data){ //������ ���� �����ο� ���� �ȳ��� ���� :�����ε�(overloading) :�ϳ��� �̸����� �������� ����� ����
    	window = data; //â���� ���� �ʱ�ȭ
    	
    }
    
   
    void write() {
    	int num = 100; //local variable,write�ϰ� ��ȿ�ϴ�
    	//�Լ��� ȣ��Ǹ� �׶� �޸𸮿� �����ǰ� �Լ��� ����Ǹ� �޸𸮿��� �������.(num �̱׷�)
    	//1.window = 11 �ʱ�ȭ �� �� �ִ� ����? �ֵ�.
    	window = 111;
    	
    	int age =0; //local variable
    	System.out.println(age); //The local variable age may not have been initialized �ʱ�ȭ�� �ȵƾ���� ���̰�,�������� ����� ������ �ϸ� ������
    }
    
    void print() {
    	System.out.println("iv : " + iv);
    	//System.out.println("num : " + num); �ڽ��� �Լ� ���������� ...
    }
}


class Apt{
	int window; //�ν��Ͻ����� = ��ü����
}




public class Ex02_Variable {
    public static void main(String[] args) { //main�� (Ư����) �Լ�  >>������
    	
    	/*
    	Test t = new Test();
    	t.print();
    	t.window = 10;
    	System.out.println("t.window : " + t.window);
    	
    	
    	Test t2 = new Test(100);
    	System.out.println(t2.window);
    	
    	Test t3 = new Test(2);
        System.out.println("t3.window" + t3.window); 
        t3.write();
        System.out.println("�Լ� ȣ�� �Ѵ�����...t3.window" + t3.window); 
    	
    	*/
    	
    	
    	int lv = 500; //local variable (���� ����)
    	System.out.println("lv ������ : " + lv);
    	//Ex02_Variable > javac ������ > class >java > ���� > JVM
    	//����Ű : ctrl + F11 (������ >> ����)
    	
    	//1. ���������� �ݵ�� �ʱ�ȭ�� �ϰ�! ����ؾ��Ѵ�. (������ ó�� ���� �Ҵ��ϴ� �����ʱ�ȭ�����)���� ������ 10���ָ� �װ� �ʱ�ȭ
        //2. ���( �Լ��ȿ� �ִ� ������ �ݵ�� �ʱ�ȭ) ����...main �� �Լ���...
    	
    	int number=0; //�ʱ�ȭ
    	number = 100;
    	number = 200;
    	System.out.println("number : " + number);
    	
    	
    	//����� �Ҵ�(�ʱ�ȭ)�и�
    	int a;//����
    	int b;
    	
    	a = 10;//�ʱ�ȭ
    	b = 20; 
    	System.out.println(a);
    	
    	
    	//�����տ��� Ÿ���� ����// ex)int
    	
    	Apt ssung = new Apt();
    	System.out.println(ssung.window);
    	Apt ppark = ssung; //���� ���� ���� ��� ����
    	ppark.window = 100;
    	System.out.println(ssung.window);
    	System.out.println(ppark); //Apt@15db9742 �� �ּ��� //���赵 �̸� + @ + �ּ�
    	
    	Apt oosan = new Apt();
    	oosan.window = 100;
    	System.out.println(ssung.window);
    	//���� �Լ��ȿ� �ִ� ������ ����������, ���������� �ʱ�ȭ�� �ؼ� ����ؾ��Ѵ�
    
    	
    	

	}

}
