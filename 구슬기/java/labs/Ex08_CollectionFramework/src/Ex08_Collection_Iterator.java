import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;

//Collection FrameWork
//������ �ڿ��� ���� ���������� �����ؼ� ���� �����ϴ� ǥ���� �����س���. �ڹٸ�������..
//Iterator �������̽���
//1.hasNext() ,Next(), ..�̷� �̸����α����ض�(����)
//2.Collection{ public Iterator iterator();}  �̰� List �� ��ӹް�  ArrayList �� �����Ѵ�.
//>>hasNext(), Next(), remove() >> ������ �� ���ؼ� �����ߴٴ� ���..   �÷����������̽��� ���ͷ����� �������̽��� �����ϴ� �޼ҵ带 �����ְ� ��� ����Ʈ�� hasNext(), Next�� �����ߴ�.
//3.ListIterator : ����� ����... �����͸� read �Ҽ��ִ� ǥ��ȭ ����...

public class Ex08_Collection_Iterator {
	public static void main(String[] args) {
		
		ArrayList list = new ArrayList();
		list.add(100);
		list.add(200);
		list.add(300);
		
		//�������
		for(int i =0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		
		//�̰� �÷��ǿ��� �̾߱��ϴ� ǥ��ȭ�� ��¹���̴�.
		Iterator it = list.iterator();  //for ���..
		while(it.hasNext()) { // hasNext = it�� ���� �ִ�?
			System.out.println(it.next()); //next = 1���� ������.
		}
		
		
		//ArrayList<int> intlist = new ArrayList<int>();  //int �� ����Ÿ���� �ƴ϶� ��������. Integer�� �;���
		
		ArrayList<Integer> intlist = new ArrayList<Integer>(); //Generic �ּ�Ÿ�Ը� �޴´�. 
		intlist.add(44);
		intlist.add(55);
		intlist.add(66);
		
		Iterator<Integer> list2 = intlist.iterator(); //���ʸ����� ������ Ÿ������ ���ͷ����͵� �޾�����Ѵ�. 
		while(list2.hasNext()) {
			System.out.println(list2.next());  //44 55 66
		}
		
		for(int i = 0; i< intlist.size();i++) {
			System.out.println(intlist.get(i)); //44 55 66
		}
		System.out.println("----------------------------------------------");
		
		//�Ϲ� for������ ������ ��� �����Ѱ���?
		for(int i = intlist.size() -1; i>=0 ;i--) {
			System.out.println(intlist.get(i)); //66 55 44
		}
		//Iterater ��� ������ ��ȸ �Ұ�
		
		
		//������ ��ȸ....������ش� ��� ������. (����: ��������� ��  �ٽÿ��������� )
		
		//������ �ѹ��Ѵ㿡 hasPrevious() ����� ��.
		ListIterator<Integer> li2 = intlist.listIterator();
		while(li2.hasNext()) {
			System.out.println(li2.next());
		}
		//������
		System.out.println("*********");
		while(li2.hasPrevious()) {
			System.out.println(li2.previous());
		}
		
		
	}

}
