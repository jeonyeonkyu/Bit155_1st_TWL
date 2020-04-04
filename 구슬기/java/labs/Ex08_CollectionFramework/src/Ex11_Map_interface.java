import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/*
 Map �������̽�
 Map <<(Ű,��) ���� ������ ���� �迭
 ex)������ȣ(02,����)(031,���)
 key:�ߺ�(x)
 value : �ߺ�(o)
 
  Map�� generic ����
 
 
 Map �������̽��� �����ϴ� Ŭ����
 ������ : HashTable(����ȭ)           (���� ���� �Ⱦ��̰� �̸��� �����ϴ� �����̴�..)
 �Ź��� : HashMap(����ȭ�� �������� �ʾƿ�) : ���ɰ��
 ���ݱ��� (Thread�� ����� ������ ����ȭ�� �ǹ̰� ����.)
 */
public class Ex11_Map_interface {
	public static void main(String[] args) {
		HashMap map = new HashMap();
		map.put("Tiger", "1004"); //Object Type�̶󼭾ƹ��ų� ���ü��ִ�.
		map.put("scott", "1004");
		map.put("superman", "1004");
		
		System.out.println(map.containsKey("tiger")); //��ҹ��� ����������ϱⶫ��  false   �� �̷� Ű�ִ�?
		System.out.println(map.containsKey("Tiger"));  //true
		System.out.println(map.containsValue("1004")); //true                      �� �̷� ����ִ�?
		
		//key �����ϸ�  value ���� ��´�
		System.out.println(map.get("Tiger"));  //value : 1004
		System.out.println(map.get("hong"));   //�ش�Ǵ� key ������ null��ȯ
		
		map.put("Tiger","1005");  // Ű�� ������ �ߺ����� �ִٰ� �ȵ�� ���°� �ƴ϶�. ��! Ÿ�̰��� ������� �ٲٰ� �ͱ���?    value �� �ٲ�..
		System.out.println(map.get("Tiger")); //1005 �� �ٲ�
		System.out.println(map.size()); //3
		
		Object value = map.remove("superman");  //���� ����鼭 value ���� value ������ �Ҵ��Ѵ�.
		System.out.println("value : "+ value);
		System.out.println(map.toString()); //{scott=1004, Tiger=1005}
		
		System.out.println("-------------------------");
		
		Set set = map.keySet(); //key�� ������ (����(x), �ߺ�(x) >>�׷� ���� �� �ִ� �׸��� Set �̴�.  
		Iterator it = set.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
		Collection vlist = map.values(); //value���� ��� ����
		System.out.println(vlist.toString());
		
		
		
	}

}
