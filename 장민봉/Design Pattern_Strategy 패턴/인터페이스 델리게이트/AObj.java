
public class AObj {
	Ainterface ainterface;
	
	public AObj() {
		ainterface = new AinterfaceImpl();
	}
	public void myFunction() {
		//����
		ainterface.myfunction();
	}

}
//myFunction�̶�� ����� �ʿ��� �ٸ� AObj��ü �������� �̹̰��� ����� AinterfaceImplŬ������ �����صξ��⿡
//AObj��ü�����Ҷ� Ainterface�ɹ� ������ AinterfaceImpl��ü�� ��´�. 
//�׷��� �ᱹ AObj��ü�� myFunction�޼ҵ�� Ainterface������ü�� ����� �����ϴ� ���̴� �̰��� ��������Ʈ����Ѵ�.
