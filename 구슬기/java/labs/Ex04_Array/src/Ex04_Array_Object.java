class Person{
	String name;
	int age;
	void print() {
		System.out.println(this.name + "/" + this.age);
	}
}
public class Ex04_Array_Object {

	public static void main(String[] args) {
		int[] intarr = new int[10];
		boolean[] boarr = new boolean[5]; //false
		//�� Ÿ�� �迭
		//�� Ÿ�� �迭�� ������ ���� [�⺻��]���� �ʱ�ȭ
		
		//���� Ÿ�� �迭
		Person p = new Person();
		p.name = "ȫ�⵿";
		p.age = 100;
		
		//���� Ÿ���� �⺻�� : null
		Person[] perobj = new Person[3];
		//person ��ü�� ���� �� �ִ� �游 ���� ��
		System.out.println("perobj : "+ perobj); //perobj : [LPerson;@15db9742
		System.out.println("perobj[0] : "+ perobj[0]); //perobj[0] : null
		
		//*** ��ü�迭�� ���� ����� �۾��� ���� ä��� �ʱ�ȭ �۾� ����
		perobj[0] = new Person();
		perobj[0].name ="ȫ�浿";
		perobj[0].age = 100;
		System.out.println("perobj[0] "+ perobj[0]);
		System.out.println(perobj[0].name+ "/" +perobj[0].age);
		//�̽������� perobj[0]�� �ּҰ� ����������
		System.out.println("perobj[1] "+ perobj[1]); //null
		
		Person person = new Person();
		perobj[1] = person;               //27���� �ٸ�������� ���� ��ü �����Ѱ���
		
		perobj[2] = new Person();
		
		//for��
		for(int i =0;i<perobj.length;i++) {
			System.out.println(perobj[i]);  //��ü�� �ּҰ��� ������.
		}
		for(int i =0;i<perobj.length;i++) {
			System.out.println(perobj[i].name);  //��ü�� �ּҰ��� ������.
		}
		
		//��ü�迭(Today Point)
		//1.int[] arr = new int[5];
		Person[] pa_array = new Person[5]; //��ü�� ��� �׸��� ���� ���� null ����  //person�ڸ��� Ŭ���� �̸��� �����
		for(int i = 0; i<pa_array.length;i++) {
			pa_array[i] = new Person();
			System.out.println(pa_array[i]); //�̷��� �ּҰ��� ����
		}
		
		//2.int[] arr = new int[]{10,20,30};
		Person[] pa_array2 = new Person[] {new Person(),new Person(),new Person()};
		//����Ÿ�� �迭�� ��ü�� �ּҰ����� �ʱ�ȭ��Ų��.
		
		//3.int[] arr = {10,20,30}; //�����Ϸ�...�� ���ֱ� ��ٸ���
		Person[] pa_array3 = {new Person(),new Person(),new Person()};

	}

}
