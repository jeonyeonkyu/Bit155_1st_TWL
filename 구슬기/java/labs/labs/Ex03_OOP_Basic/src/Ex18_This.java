/*
 This
  1.��ü �ڽ��� ����Ű�� this(������ ������ ��ü�� �ּҸ� ���� ���̶�� ����)
  2.this  ��ü�ڽ�(������ ȣ��) : ��Ģ������ ���� >> �����ڴ� ��ü�� ��������� 1���� ȣ��
       ������ ���������� this �� Ȱ���ϸ� �������� �����ڸ� ȣ���Ҽ��ִ�.   (Today Point)
        
 */
class Test6{
	int i;
	int j;
	Test6(){  //default constructor �⺻ ������
	
	}
	//������ ���忡�� ��
	//
//	//Test6(int i, int j){
//		i = i;
//		j = j;
//	}
//	Test6(int k, int p){  //�������� ����� ��ġ��, ������.. �ǵ����̸� �Ķ���� �̸��� ����� �Ҵ��Ϸ��� �ϴ� instance variable ��� �����ϰ�..
//		i = k;            //�����Ҷ� �ǹ��ִ� ������ >>������ >>��������....�ڵ带 ������ ���߰��Ǵ°� �ִ�.(���� �̷��� ���ư��ڱ���! )
//		j = p;
//	}
	
	//������ �����ϴ� �� ������... ������ �Ķ���Ͱ��� �Ȱ��� ������
	// int i;
	// int j;
	//parameter �޴�  i, j �ٸ��ٴ°���
	//this > Test6�� ��Ī.
	Test6(int i, int j){  
		//this.i >> Test6 ������ �ִ� member
		this.i = i;
		this.j = j;
//		i = i;
//		j = j;
	}

}

class Book2{
	String bname;
	Book2(String bname){
		this.bname = bname;
	}
}



//Today point


class SoCar{
	String color;
	String geartype;
	int door;
	
	SoCar(){ //�⺻Ÿ��
		this.color = "red";
		this.geartype = "auto";
		this.door = 2;
	}
	SoCar(String color , String geartype , int door){
		this.color = color;
		this.geartype = geartype;
		this.door = door;
	}
	
	void print() {
		System.out.println(this.color + "/"+ this.geartype + "/" + this.door);
	}
	
}


public class Ex18_This {

	public static void main(String[] args) {
		Test6 t6 = new Test6(10,20);
		System.out.println(t6.i);
		System.out.println(t6.j);
		
		Book2 book = new Book2("ȫ�浿��");
		
		SoCar socar = new SoCar();
		socar.print();
		
		SoCar socar2 = new SoCar("blue", "auto", 6);
		socar2.print();
		
				
		
		

	}

}
