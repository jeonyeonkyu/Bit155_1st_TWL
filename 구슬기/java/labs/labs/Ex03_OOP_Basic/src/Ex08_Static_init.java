//static ������ ��ü���� ���� ���� ������ �Ұž�
//instance ������ ��ü���� �ٸ� ���� ������ �Ұž�

//�������� ���ذ� ���� �������� �׳� �ܿ�°͵� ����̴�.


class InitTest{
	static int cv = 10;	//����ƽ�� Ŭ���� �̸����� ���� ���� 
	static int cv2 = 2; 
	int iv = 1;          // �ν��Ͻ��� ��!
	
	static { //[static�ʱ���] : static ���� �ʱ�ȭ(�������) Ŭ���� �δ��� �����鼭 ����ȴ�.
		     //�� �긦 ����? �� ������ ���� ���� ������ ���´�.
		     //���� ����.. ���� ���� �ڵ尡 �ȴ�. ex> cv2 = cv + 20; �̷���
		cv = 20;
		cv2 = cv + 20;
	}
	
	
	
	//�ʱ��� (static memberfield �� memberfield �� ���� �ʱ�ȭ)
	{ //�� �߰�ȣ �س��°���[ �ʱ��� ]��� ��>> �޸𸮿� iv ��� ������ �ö󰡰� ���� �ٷ� ����ȴ�.
      //instance ������ �ʱ�ȭ
		iv = 3;   //�ʱ� �����س��� ��1 ���� 3�� ����δ�.
	}
	
}




public class Ex08_Static_init {

	public static void main(String[] args) {
		System.out.println(InitTest.cv);
		InitTest init = new InitTest();
		System.out.println(init.iv);
		

	}

}
