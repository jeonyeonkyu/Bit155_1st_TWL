package kr.or.bit;
/*
 ��� , ���� ����� ���
 �Լ�(function)(method)
 
 �Լ�(method) : ���� �Ǵ� ����� �ּҴ��� >> [**�ϳ��� ��� �� ����**]
 ex)�Դ´�, �ȴ´� , �ܴ�...
 
 Ŭ���� :  �ʵ� +�Լ�+������
 
 ex) ���ӹ� : ���ӱ� �����ְ�... �Լ�����
             �����Ǳ� �����ְ� ������ �޴°�  ...�Լ�����
             
 Java �Լ� ����(4����)
 1. void, parameter(0) : void print(String str) {�����ڵ�}
 2. void, parameter(x) : void print(){�����ڵ�}    //�����ִ� ������ ����
 3. return Type , parameter(0) : int print(int data) {return 100;}
 4. return Type , parameter(x) : int print(){return 100;}    
 
 void >> �����ִ� ���� ����>> return value ����
 return Type : 8���� �⺻Ÿ��(byte car short int long float double boolean)      
               + String + ����Ÿ�� + Array + Collection + Interface
ex) Car print(){ return new Car();}
ex) boolean print(){return true;}

 parameter (����, �μ� ,�Ű��� , ���ް� ) : ���ӱ��� ���������̴�.(���� ����1��, �������ϼ��� �ִ�.)
 ���� ������ 2���� 2���� �־�� �����. �������� ������? ���� ���� �� �־����. �ϳ��� ������ �ȵ�!
 ex) void print(int a, int b, int c, int d, int f....) >> print(10,20,30,40)�װ� �־ ���� �ȵ�.
                                                       >> print(10,20,20,10,10) �̰ǵ�  ���� "A' ������ �ȵ�! int �� �ƴ϶�.

�Լ��� �̸��� : ������ ǥ��   
�ǹ��ִ� �ܾ� ����
:getChnnelNumber(),getEmpListByEmpno()>>������� ��������Ʈ �����Ͷ� �̷� ����. �̸����� ������� ���߰� �����ϰ� ��������.
�Լ� ù���ڴ� �ҹ���. Ŭ���� �ձ��ڴ� �빮��

�Լ���� ���� �ݵ�� ȣ��(call)�Ǿ�߸� ����ȴ�.:������ ���� �̸��� �θ��� ������ ������ �ȵȴ�. //main�� ���� �˾Ƽ� ��.(static�پ��־)


 */

public class Fclass {
	public int data; //instance variable
	
	//void m()
	public void m () { //�����Ϸ��� public �� ������ ���������� default void m ���� �ؼ��Ѵ�.
		System.out.println("�Ϲ��Լ� : void, parameter(x)");
	}
	
	
	// void m(int..)
	public void m2(int i) {
		System.out.println("parameter valus (scope :�Լ�����) :" + i);
		System.out.println("�Ϲ��Լ� : void , parameter(0)");
	}
	
	public int m3() {
		return 100; //return type �ִ� �Լ��� �ݵ�� return Ű���带 ����ؾ���
	}
	
	public int m4(int data) {
		return data + 1;
	}
	//�������� �⺻..
	//Ȯ�� 
	public int sum(int i , int j, int k){
		return i + j + k;
	}
	
	//�Լ��� ������µ�
	//������ >> default int subSum()
	//�ٸ� ����(��Ű��)���� ����Ҽ�����.
	/*
	int subSum(int i) {
		return i+100;
	}
	*/
	//�������� �ǵ� : subSum �Լ��� Ȱ���� ���ο� �ٸ� �Լ��� �����ִ� �Լ��� ����ڴ�.
	//�̰��� ���� ������ ������ �ʴ´�.
	//�ǵ�: subSum() ��ü(��������)�� �������� ���ϰ� �ϸ鼭 ���ο����� ���.
	//private ������, ������
	//1. Ŭ���� ���ο����� �ǹ̰� ����. (( ���� ���Ǿȿ� ���� ����� �ִ����� �ٺ���)
	//2. ��������(Fclas f = new Fclass()) f.private ���� ����.
	
	//subSum �̶�� �Լ��� [�ٸ� �Լ��� �����ϴ� �Լ�]��. �׷��� ���� ȣ�� �Ǿ�� �ȵȴ�.
	//���ο��� �ٸ� �Լ��� ȣ���ؼ� ���ȴ�. �̷��Ի���Ϸ��� private�� �ٿ�����.
	//private >�ٸ� �Լ��� �����ִ� �Լ���. �����μ� ���̷�Ʈ�� �����ϴ� �Լ��� �ƴϴ�.
	//�ٸ� �Լ��� ����ϴ� [���� �Լ�]
	
	private int subSum(int i) {
		return i + 100;
	}
	public void CallSubSum() {
		int result = subSum(100);
		System.out.println(result);
	}
	
	public void print(int data) {
		System.out.println("data : "+ data);

	}
	
	private int operationMethod(int data) {
		return data * 200;
	}
	
	public int opSum(int data) {
		int result = operationMethod(data);
		if(result > 0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	//Quiz
	//a�� b ���߿� ū���� return �ϴ� �Լ��� ���弼��
	//ex) max(500,300) return ���� 500 �ް� �ϸ� �ǿ�
	//public int max(int a , int b)
	
	/*
	 * 30�� ¥���� :return���� �ݺ��� ����� ������������.
	public int max(int a, int b) {
		if(a > b) {
			return 500;
		}else {
			return 300;
		}
		
	 * 60�� ¥��
	 * int result = 0;
	   if(a>b){
	   	  result = a;
		}else{
		   result = b;
		}
		return result;
		
	* 90�� ¥��
	  int max = (a>b) ? a: b;
	  return max;
	  
	  100�� ¥��
	  return (a > b) ? a: b;	
	  
	  ���� ������ ���� ������ ������.
	*/
	
	
	public int max(int a , int b) {
		return (a > b) ? a : b; 		
		}
	
	public String concat(String s ,String s1 , String s2) {
		//String result = s + "/" + s1 + "/" + s2;
		//return result;
		return s + "/" + s1 + "/" + s2;	
		
			 
	}
	//�������� �Լ��� �⺻��
			//Ŭ������ Ÿ���̴�...
			/*
			 public int call(int i, int j){return i + j;}
			 public Tv call(){}   //int �ڸ��� Tv �־ �翬�ϰ� �޾Ƶ鿩���Ѵ�. Type ==Class ==���赵 �ϱ� Ÿ���� int�ڸ��� Tv ����������
			 
			 public TV tcall(){return new TV();} 
			 
			 1�� : return new TV(); // TV Ÿ�԰� ���� ��ü�� �ּ� �� �ѱ���� �޸𸮿� �־ ����Ŵ�.
			 2�� : TV t = new TV(); return t;
			 3��:
			 4�� :
			 5�� : return null;  //���� �����θ� �´�. 
			 */
	public TV tcall(){return new TV();} 
	
	public TV tcall2(TV t , TV t2) {
		t.brandname = "A";
		t.ch = 99;
		return t;
	}
	public int tcall3(int i) {
		return i + 100;
	}
	
	/*
	 * Today point
	 * Ŭ������ memory ���ٰ��÷��� ��밡���ϴ�.
	 * TV t = new TV(); >> t ��� ������ TVŸ�� ��ü�� �ּҸ� ���´�
	 * 
	 * 
	 */
	public TV objMethod() { //TV��� Ÿ���� ��ü �ּҸ� ������ ..�������� �޼Ҵ� Ƽ��Ÿ�� ��ü�� �ּҸ� �Է��ؾ� ���Ѵ�.
		TV tv = new TV();
		return tv;
	}
	
	public TV objMethod2() { 
		return new TV();
	}
	
	public TV objMethod3(TV t) { //TV��� Ÿ���� ���� ��ü�� �ּҸ� ..
		return t;
	}
	/*
	 main
	 1. TV t = new TV();
	 t.objMethod3(t);
	 
	 2.
	 t.objMethod3(new TV()); //t ��� ������ new TV() �ּҰ��� �޴´�.
	 
	 */

}
