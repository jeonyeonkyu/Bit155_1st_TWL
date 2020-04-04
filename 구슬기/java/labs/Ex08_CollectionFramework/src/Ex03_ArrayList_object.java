import java.util.ArrayList;

import kr.or.bit.Emp;

public class Ex03_ArrayList_object {

	public static void main(String[] args) {
		
		//��� 1���� ���弼��
		Emp emp = new Emp(100,"������","����");
		System.out.println(emp.toString()); 
		
		
		//Array   (�����迭, �����迭)
		//��� 2�� ���弼��.
		Emp[] emplist = {new Emp(100,"�达","�Ϲ���"),new Emp(200,"�ھ�","�л�")};
		for(Emp e : emplist) {
			System.out.println(e.toString());
		}
		
		//�Ѹ��� �Ի縦 ���޳׿�? �߰��ϼ��� . 
		//���� �迭�δ� �߰������ϰ� �ƿ� ���� �������Ѵ�. 
		
		//Collection
		ArrayList list = new ArrayList();
		list.add(new Emp(1,"��","IT"));
		list.add(new Emp(2,"ȫ","IT"));
		
		System.out.println(list); 
		//[Emp [empno=1, ename=��, job=IT], Emp [empno=2, ename=ȫ, job=IT]]  �������̵� �Ǿ �̰� ���´�.
		//System.out.println(list);   == System.out.println(list.toStinrg()); 
		// [xx����.toString(); , yy����.toString()] �������̵� �ȵǾ������� �ּ�.
		
		System.out.println(list.get(0)); // Emp [empno=1, ename=��, job=IT]
		
		
		//toString �� Ȱ������ ���� ��� ����غ�����.
		//�Ϲ� for������
		for(int i =0; i<list.size();i++) {
			//list.get(i)   �̷� ��ü�� �ٳ��´�
		//	Object obj = list.get(i);
	//obj �ȿ� Emp �� �ּҰ� ����ִ�. 
			Emp e = (Emp)list.get(i);  //�θ�Ÿ���� �ڽ�Ÿ������ ������ �ڽ�Ÿ�Կ� �°� ĳ���� �ؾ��Ѵ�. 
			System.out.println(e.getEmpno()+ "/"+e.getEname()+"/"+e.getJob());
			
 		}
		
		System.out.println("--------------------------");
		
		//toString ������� ���� ������ for������ ����غ�����.
		//¥��..ĳ������ ��� ...�ٿ�ĳ���ÿ� ��������....
		for(Object j : list) {
			Emp e = (Emp)j;
			System.out.println(e.getEmpno()+ "/"+e.getEname()+"/"+e.getJob());
		}
		
		
		System.out.println("---------���ʸ�----------");
		//���ʸ�... (Ÿ���� �������ֱ�)   �̰Ÿ� �� ���ϰڴ�??
		
		//Object ������.. generic
		ArrayList<Emp> list2 = new ArrayList<Emp>(); //���� ������ ���� Ÿ���� Emp Ÿ�� �̾�!!!
		list2.add(new Emp(1,"A","IT"));
		list2.add(new Emp(2,"B","IT"));
		//list2.add(10);  �� ������ ����
		
		for( Emp e : list2) {
			System.out.println(e.getEmpno()+ "/"+e.getEname()+"/"+e.getJob());
		}
		
		System.out.println("----------���Ի�� �߰�-----------");
		
		//�׷��� �߰� �Ի�� �̷��� �ϸ� ��!
		list2.add(new Emp(3,"NEW","NEW"));   
		System.out.println(list2); // [Emp [empno=1, ename=A, job=IT], Emp [empno=2, ename=B, job=IT], Emp [empno=3, ename=NEW, job=NEW]]
		//System.out.println(list2.toString());
		
		
		

	}

}
