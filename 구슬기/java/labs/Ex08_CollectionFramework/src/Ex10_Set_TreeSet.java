import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

public class Ex10_Set_TreeSet {
	public static void main(String[] args) {
		//Set �������� (x), �ߺ�(x)
		HashSet<String> hs = new HashSet<String>();
		hs.add("B");
		hs.add("A");
		hs.add("F");
		hs.add("K");
		hs.add("G");
		hs.add("D");
		hs.add("P");
		hs.add("A");
		hs.add("B");
		
		System.out.println(hs.toString()); //[P, A, B, D, F, G, K] HashSet �� ����������� �ߺ�����.
		
		//HashSet Ȯ�� >>LinkedHashSet(��������) >> Linked(�ּ�: node)
		Set<String> hs2 = new LinkedHashSet<String>(); //�θ�Ÿ������ �޴� ������ �鿩����. 
		hs2.add("B");
		hs2.add("A");
		hs2.add("F");
		hs2.add("K");
		hs2.add("G");
		hs2.add("D");
		hs2.add("P");
		hs2.add("A");
		hs2.add("B");
		
		//������ �����ȴ�.(�Է��ϴ� ����)
		System.out.println(hs2.toString()); //[B, A, F, K, G, D, P]
		
		//TreeSet
		//���ĵȴ� (��������, ��������)
		//�ڷᱸ��(����(x)-������ ������ξ������� , �ߺ�(x), ����(o)-Űũ���ξ�������) 
		//�˻��ϰų� ������ �ʿ���ϴ� ������ ���տ��� ���ȴ�.
		//�ζ� ... 
		//1.����Ʈ�� ������ ������ �ִ�.
		//2. �����Ͱ� ����ɶ�  ���ĵȴ�. (�����Ǿ ����Ǵϱ�!)
		//�ζ� ������
		//�����ӿ����� ���Ͽ� �ڵ��� ���̰� ��û���� �پ���.  
		//�ʺ��϶��� ������������
		Set<Integer> lotto = new TreeSet<Integer>();
		for(int i = 0;lotto.size()<6 ;i++) {
			lotto.add((int)(Math.random()*45)+1);
		}
		//System.out.println(lotto.toString()); //[6, 16, 22, 26, 34, 45]
		
		
		//Iterator �� �غ���.
		Iterator<Integer> lo = lotto.iterator();
		while(lo.hasNext()) {
			System.out.println(lo.next());
		}

	}

}
