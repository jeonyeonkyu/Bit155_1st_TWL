import javax.swing.JOptionPane; //���� �ڹٵ�...�޸��尰����,���� ,�׸��ǰ����� ���� �� �ִ�..������ ���̻����������ʴ´�. ���� C or C#���� �����. ����  �ڹٸ� ����==�����Ѵ�. 

//�ܾ� ���߱� ����
//������ ����
//�����ð�...�� �־�����.. �ð��� ������ ������ ����ȴ�.
//������ ������Ѵ�. 

//�ð��������� �Լ�
//�� �Է��ϴ� �Լ�  �ΰ��� ���ÿ� ������ʹ�.

public class Ex03_Single_Word_Game {
	public static void main(String[] args) {
		String inputdata = JOptionPane.showInputDialog("���� �Է��ϼ���"); //�н������δ� �����ϴ�. 
		System.out.println("�Է°�: "+ inputdata);
		timer();

	}
	static void timer() {
		for(int i = 10; i>0;i--) {
			try {
				System.out.println("�����ð�: "+i);
			} catch (Exception e) {
				System.out.println(e.getMessage());

			}
		}
	}

}
