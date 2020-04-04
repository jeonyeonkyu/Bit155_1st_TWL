import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

//Set �������̽��� �����ϴ� Ŭ����
//Set �� �ȿ� ������
//������ ���� ����(x) , �ߺ�(x) : ������ ���� �ߺ��� ������� �ʴ� ������ ����....Set 
//�����ϴ� Ŭ���� : HashSet , TreeSet

public class Ex09_Set_Interface {
	public static void main(String[] args) {
		
		HashSet<Integer> hs = new HashSet<Integer>();
		hs.add(1);
		hs.add(100);
		boolean bo2 = hs.add(55); //���ȿ� ���� ���� �����ִ���..
		System.out.println(bo2); //true ���������� ���ȿ� ���� true �� �ֳ���
		System.out.println(hs.toString()); //[1, 100, 55]
		
		bo2 = hs.add(1); //���� �����ʹ� �߰��� �ȵ˴ϴ�.(����Ǵ� Set)
		System.out.println(bo2); //false  ���ȿ� ����� ����..  �ߺ��̴ϱ�. 
		System.out.println(hs.toString()); //[1, 100, 55]
		hs.add(2);
		System.out.println(hs.toString()); //[1, 2, 100, 55] 2�� �ߺ��� �ƴ϶� ����, ��µɶ����� ���� ������ �ٸ���.
		
		
		System.out.println("----------------------------------------------------");
		
		
		HashSet<String> hs2 = new HashSet<String>();
		hs2.add("b");
		hs2.add("A");
		hs2.add("F");
		hs2.add("c");
		hs2.add("z");
		hs2.add("A");
		hs2.add("A");
		hs2.add("A");
		System.out.println(hs2.toString());  //[A, b, c, F, z]  ��ġ�� ���� A �� �ȳ��´�.
		//5��  �ζ�...�ߺ��� ���������ϱ�.. 
		
		System.out.println("----------------------------------------------------");
		String[] obj = {"A","B","C","D","B","A"};
		HashSet<String> hs3 = new HashSet<String>();
		for(int i = 0; i< obj.length ;i ++) {
			hs3.add(obj[i]);
		}
		System.out.println(hs3.toString());  //[A, B, C, D]  ��ġ�� �� ���� ����.
		
		
		System.out.println("----------------------------Quiz---------------------");
		//Quiz
		//HashSet �� ����ؼ� 1~45 ������ ���� 6���� ��������
		HashSet<Integer> lotto = new HashSet<Integer>();
		for(int i = 0; lotto.size()<6 ;i++) {  //size �� 0���� ���� �������� 1�� ������ �ߺ����� ���� �ʱ⶧����  ...i���� �ǹ̰� ����. i�� 100�̵� 1000�̵�  lotto.size() 6�� �ɶ����� ���⶧����!!! 
			int num = (int)(Math.random()*45)+1; // 0.0 <= random < 1.0 -> 0.0 <= random < 45.0 -> +1 
			lotto.add(num);
		}
		System.out.println(lotto.toString()); //�ߺ����� ���ü��� ����... �ߺ����� ������ ���ƹ�����.. ��� ���鼭 �������� �ƴҶ��� �ϳ��� ä���. 
		
		System.out.println("----------------------------------------------------");
		//while ��ȯ
		Set set2 = new HashSet(); //Set �� HashSet �� �θ�ϱ� ����!
		int index = 0;
		while(set2.size()<6) {  //������ true �� ��� ����.
			System.out.println("index : "+ (++index));
			int num = (int)(Math.random()*45)+1;
			set2.add(num);
		}
		System.out.println("set2 : "+set2.toString());  //index �� ��� ���ҳ��� �����ش�.
		
		
		//
		HashSet<String> set3 = new HashSet<String>();
		set3.add("AA");
		set3.add("DD");
		set3.add("ABC");
		set3.add("FFFF");
		System.out.println(set3.toString());  //[AA, DD, FFFF, ABC] ������ ���ڴ��
		
		Iterator<String> s =set3.iterator();
		while(s.hasNext()) {
			System.out.println(s.next());   // AA  DD FFFF  ABC      ...index ������ �������� �ʾƿ�.
		}
		
		//Collections.sort(list<T>);
		//sort �Լ��� parameter �� List �������̽��� ������ ��ü�� �ü� �ִ�. 
		//Vector, Stack, ArrayList, LinkedList >> ��������� �迭�̱⶧���� ������ �ٲ� �� �ִ�... >> ���İ���
		
		List list = new ArrayList(set3); //��? �÷����������̽���  �°� ����Ʈ�� ����ϰ� �ְ�, �°� ����Ʈ�� ��(�ؽ���, Ʈ����)  ����Ʈ(����, ��̸���Ʈ�����ִ�) ..�θ� �ڽİ�ü �߼� �����������ϱ�.
		// �θ�                         �ڽ�
		// �ڽ�                      (�ڽ�) �θ�
		        // ArrayList(Collection)            //Collection �θ� �ڽİ�ü�� HashSet �ּ� �� �������ִ�. 
		System.out.println("before ������ : "+ list.toString()); //before ������ : [AA, DD, FFFF, ABC]
		Collections.sort(list);
		System.out.println("after ���� : "+ list.toString()); //after ���� : [AA, ABC, DD, FFFF]
		//set ���� ������� �����ϰ� �;����� list �� ������ �ȴ�.
		
		Collections.reverse(list);
		System.out.println("reverse ���� : "+ list.toString()); //reverse ���� : [FFFF, DD, ABC, AA
				
		
		//set �� �����ϰ� �ִ� Hashset �� �ߺ������ʴ� �����͸� �������� �ٷ� ���ֵ�. ex �ζǹ�ȣ.
		//Hastset�� ����ϸ� �ߺ��������� ������ ������ ����޴´�. ��� �����¾���.  
		//Hash?  ������ �༮���� ...�ʹ� �����.. ���ȿ� �� �� �� ������ �� ������ ����. 

	}

}
