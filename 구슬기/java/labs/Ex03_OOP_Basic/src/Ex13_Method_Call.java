class Data{
	 int i;
}


public class Ex13_Method_Call {
	

	public static void main(String[] args) {
		Data d = new Data();
		d.i = 100;
		System.out.println("d.i : "+ d.i);

		scall(d); //�ּҰ� �Ҵ� �ּҰ��� ���� �ٲ�� ���� �ٲ��.
		
		System.out.println("d.i : "+ d.i); //111
		
		vcall(d.i); //d.i>>111      ���� �ȹٲ�.  ex) 111,8888
		System.out.println("d.i : "+ d.i);
	}
	
	
	static void scall(Data data) { //�Լ��� �Ķ���ͷ� Ŭ���� Ÿ���� �ü��ִ�. �׿����� ������ Ÿ���ּҰ� ���;��Ѵ�.
		                           // Data ��� Ÿ���� ���� �ּҰ��� �޴´�
		                           //data ���� >> xx ����
		System.out.println("�Լ�: "+ data.i); //100 �� ���´�
		data.i = 111;
	}
	
	static void vcall(int x) { //��� ���� �޴´�.
		System.out.println("before : "+x);
		x = 8888;
		System.out.println("before : "+x);
	}

}
