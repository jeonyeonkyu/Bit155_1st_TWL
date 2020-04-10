import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.swing.JOptionPane;

/*
����
main �Լ� ������ Thread 2�� ����
1. �ð�(time) �����ϴ� Thread
2. �ܾ� �Է��� ó���ϴ� Thread

main �Լ� 2�� ����

�� �ܾ �ϳ��� �Է��ؼ� Ȯ�� ��ư�� ������ �ð��� ���߰� �ϼ���
hint) �����ڿ� (static)

Thread : �ڱ�鸸�� ���������� ������ �ִ���....ppt ���� state ��¼�� �ϰ� ����. 
join() �ٸ� �������� ���Ḧ ��ٸ��°�. (�ްԽǿ���)
�پ��� ��� �۾�....ex)�� �༺ �� �Ÿ��� ���ؼ�.. �� �ջ��� ����� ����...
10 ��  �� 1���� ������� �� ����� �ջ��ؾ���.  �� 1���� ������ 9���� ���������� ��ٸ��°� �װ� join().....


main �����忡�� join �ɾ  ��޷�.. WordInputProcess,


������ ����.. ����ƽ.. ����.. �ٽ��.

*/
class WordInputProcess2 extends Thread{
	
	
	@Override
	public void run() {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("�����", "�߿�");
		map.put("������", "�۸�");
		map.put("����", "�ƿ�");
		map.put("��", "����");
		map.put("��","�޿�");
		
		String dan=" ";
		Set<String> set= map.keySet(); 
		String[] ss = new String[5];
		Iterator a = set.iterator();
		String aa = null;
		while(a.hasNext()) {
			 aa = (String) a.next();
			 for(int i=0;i<ss.length;i++) {
				 ss[i] =aa;
			 }
		}
		
	    String inputdata = JOptionPane.showInputDialog(map.get(aa)+ "��� �Ҹ� �Է�");
	    
		
		
	    Collection vlist = map.values(); //value���� ��� ����
		
		if(inputdata != null && !inputdata.equals(vlist)) {
			Ex05_gugudan.inputcheck = true; //���� ����
		}
		System.out.println("�Է��� ����: " + inputdata);
	}
}


class WordTimeOut2 extends Thread{
	@Override
	public void run() {
		for(int i=10; i > 0 ; i--) {
			
			if(Ex05_gugudan.inputcheck)return; //run�Լ� Ż��
			
			System.out.println("���� �ð�: " + i);
			try {
				 Thread.sleep(1000); //���ǿ��� 1�ʰ� ������ ....
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
public class Ex05_gugudan {
	static boolean inputcheck= false;
	public static void main(String[] args) {
		WordInputProcess2 word = new WordInputProcess2();
		WordTimeOut2 time = new WordTimeOut2();
		
			
		word.start();
		time.start();
		
		try {
			word.join(); //main���� word�� ���������� ��ٷ�...
			time.join(); //main���� time�� ���������� ��ٷ�...
			//�ϳ��� �����尡 �ٸ��������� �Ϸ������ ������. 
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		System.out.println("Main END");

	}

}
