
public abstract class Computer {//����Ŭ����
	//��ü�� �����ϴ� �������̽��� �̸� �����ϵ�, �ν��Ͻ��� ���� Ŭ������ ������ ���� Ŭ���� �ʿ��� ������.	
	//���� Ŭ���� : �������� ���� Ŭ������ ���� ������ Ŭ������ ������ ��ǲ�� ���� �ϳ���
	//�ڽ� Ŭ������ �ν��Ͻ��� �������ִ� ���
	//���丮 �޼��� ���Ͽ��� Ŭ������ �ν��Ͻ��� ����� ������ ���� Ŭ������ �̷��.
	public abstract String getRAM();
	public abstract String getHDD();
	public abstract String getCPU();
	
	@Override
	public String toString() {
		
		return "RAM = " +this.getRAM()+", HDD = "+this.getHDD()+", CPU = "+this.getCPU();
	}


}
