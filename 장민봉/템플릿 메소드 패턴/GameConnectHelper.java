
public abstract class GameConnectHelper {//�װ��� �޼ҵ�� ���� Ŀ��Ʈ�� ������ ������ �װ��� �߻� �޼ҵ�� �����Ѵ�.
	// ������ ���Ŀ� �Ʒ��� �ڵ忡�� ������ �޼ҵ带 �����Ѵ�.
	protected abstract String doSecurity(String string);//��ü ���� ������ ���� Ŭ�������� ����
	protected abstract boolean authentication(String id, String password);//���� Ŭ������ ������ �ؾ��ϱ⿡ private���� �ȵ�.
	protected abstract int authorization(String userName);//protected�μ����ؾ� ������Ű������ ���ٰ���
	protected abstract String connection(String info);
	//���ø� �޼���
	
	public String requestConnection(String encodedInfo) {//�� �޼ҵ带 public���� �����ؾ� 
		//main�� ���� Ŀ��Ʈ Ŭ���� �ΰ��� ���� �ٸ� ��Ű���� �־ ȣ���� �����ϴ�
		String decodedInfo = doSecurity(encodedInfo);
		//��ȯ�Ȱ��� ������ ���̵�, ��ȣ�� �Ҵ��Ѵ�.
		String id = "aaa";
		String password = "bbb";
		
		if(!authentication(id, password)) {
			throw new Error("��ȣ ����ġ");
		}
		String userName = "userName";
		int i = authorization(userName);
		switch(i) {
		case -1:
			throw new Error("�˴ٿ�");
		case 0://���ӸŴ���
			System.out.println("");
				break;
		case 1://���� ȸ��
			System.out.println("");
				break;
		case 2://����ȸ��
			System.out.println("");
				break;
		case 3://���� ����
			System.out.println("");
			   break;
		default://��Ÿ ��Ȳ
			break;
		}
		return connection(decodedInfo);
	}

}
