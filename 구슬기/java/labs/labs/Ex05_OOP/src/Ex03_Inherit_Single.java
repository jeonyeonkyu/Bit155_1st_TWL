//�ΰ��� ���赵
class Tv {
	boolean power;
	int ch;

	void power() {
		this.power = !this.power; // ������ ������ �����°�. �޽��� Ʈ��, Ʈ��� �޽����� �ش�.
	}

	void chUp() {
		this.ch++;
	}

	void chDown() {
		this.ch--;
	}
}

class Vcr { // ���� �÷��̾�
	boolean power;

	void power() {
		this.power = !this.power;
	}

	void play() {
		System.out.println("����ϱ�");
	}

	void stop() {
		System.out.println("�����ϱ�");
	}

	void rew() {
	}

	void ff() {
	}
}

//Tv ���赵, Vcr ���赵
//TvVcr ��� ���赵����� �ּ���..   Ƽ��� ���� �÷��̾�� �پ��ִ°�.
//������ Tv, Vcr ���赵 �� �̿��غ�
//���, ���� ���±��� ����
//class TvVcr extends Tv, Vcr ���߻�ӱ���(x)
//class Tv extends Vcr
//class TvVcr extens Tv  ������ ���... ������ �ߺ����(�����̸��� ���)���� ���� �浹�� ����.  (x)

//���� 
//TvVcr ���赵 ���Ӱ�... Tv�����, Vcr ���赵 Ȱ��
//�� : TvVcr �ֱ�� �� ����? Tv �� ���� ����.   ���α�� >> ������ ���� Ŭ������ ��� �޴´�. 
// �׸��� �������� �������� �Ѵ�.
//TvVcr �ȿ� Tv, Vcr �� �����ص� �ȴ�. �Ǵ��� ������ �Ѵ�.
//������Ʈ�ϸ鼭 ���赵 ����� Ÿ������ ã�°� �߿��ϴ�.

class TvVcr extends Tv{  //Tv ��� ����� �� ����ϴϱ� ���           (���) TvVcr is a Tv .....(����)TvVcr has a Vcr....
	Vcr vcr;
	TvVcr(){
		vcr = new Vcr();  // ���� �ö󰣴�. ��ü ���� ������    Tv,TvVcr,Vcr ���� 
	}
}

public class Ex03_Inherit_Single {

	public static void main(String[] args) {
		TvVcr t =  new TvVcr();
		t.power(); //tv�� �Ŀ��̴�.                      ////////����??? �ѹ��� ����.���ؾȵǸ� �ܿ�.
		System.out.println("Tv�������� : "+ t.power);
		t.chUp();
		System.out.println("Tvä�λ��� : "+ t.ch);
		
		System.out.println("-----------------------");
		//�����Ұ�.
		t.vcr.power(); //video�� �Ŀ��̴�.
		System.out.println("���� �������� : "+ t.vcr.power);
		t.vcr.play();
		t.vcr.stop();
		
		t.vcr.power();
		t.power();
		System.out.println("Tv�������� : "+ t.power);
		System.out.println("���� �������� : "+ t.vcr.power);
		
		
	}

}
