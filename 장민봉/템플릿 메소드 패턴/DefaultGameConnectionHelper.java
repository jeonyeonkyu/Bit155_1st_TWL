
public class DefaultGameConnectionHelper extends GameConnectHelper {
//DefaultGameConnectionHelperŬ������ ���� Ŀ��Ʈ�� ������ ���� �޼ҵ�� ����� ���ǵ� �߻�Ŭ����
// GameConnectHelper�� ��ӹ޴´�
	@Override
	protected String doSecurity(String string) {
		System.out.println("��ȭ�� �˰����� �̿��� ���ڵ�");
		return string;
	}

	@Override
	protected boolean authentication(String id, String password) {
		System.out.println("���̵�/��ȣ Ȯ�� ����");
		// TODO Auto-generated method stub
		return true;//������ true��ȯ
	}

	@Override
	protected int authorization(String userName) {
		System.out.println("���� Ȯ��");//���� �Ŵ����� ���� ������ ���� Ȯ��
		//�������� ������ ���̸� �˼��ִ�.
		//���̿� �ð��� Ȯ�� �ߴµ� �̼������̸� 10�ð� �����ٸ� ������ ���� ������ �Ѵ�.
		
		return 0;
	}

	@Override
	protected String connection(String info) {
		System.out.println("������ ���� �ܰ�");
		// TODO Auto-generated method stub
		return null;
	}

}
