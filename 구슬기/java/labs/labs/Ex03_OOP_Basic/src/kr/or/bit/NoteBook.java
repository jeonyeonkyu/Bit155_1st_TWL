package kr.or.bit;

public class NoteBook {
	public String color; //�ۿ� �����ְ�
	private int year; //�ۿ��� ��������
	// ���� �Ҵ��� ���� �����Ҵ��� ���ؼ� �ڷḦ ��ȣ�ϰڴ�. 
	//�����̺��� �ϴ�����. �����Ҵ�? �ٷ� ���°� 
	//�̰� �����Ҵ� �׸��� ĸ��ȭ(���� ������� �����ִ� �� ���� ���������� ���� ���ϴ� �丸 ������ �ֵ��� �ϴ°�)
	
	
	public void setYear(int y) { //year write ����ϴ�.... ĸ��ȭ�� �Ϳ��� ������   setter�Լ�
		if(y< 0) {
			year = 1999;
		}else {
			year = y;
		}
		
		
	}
	public int getYear() { //�� �Լ�  �б��� getter�Լ� ex)ooo�� �ϰ� ������ get �Լ��� name + "��"; �ؾ���.
		return year;
	}
	public Mouse handle(Mouse m) { //���콺��� Ÿ���� �Ķ���ͷ� ����. Point m >> �ּҰ� 
		m.x =100;
		m.y = 200;
		return m;
	}
	
}
