import kr.or.bit.Card;

public class Ex06_Static_CardMake {

	public static void main(String[] args) {
		//�䱸���� card ����(�޸𸮿� �ø��°�)
		Card c = new Card();
		c.number = 1;
		c.kind = "heart";
		c.h=70;
		c.w=50;
		c.cardInfo();
		
		Card c2 = new Card();
		c2.number = 1;
		c2.kind = "heart";
		c2.cardInfo();
		
		//53�� ���� 
		//���� �䱸������ �ٲ���� : ũ�Ⱑ �̰� �ƴѵ���?? ��� �Ѵ�.
		//ũ�⸦ �ٲ��ּ���
		//h = 70  w= 50
		//���赵�� �ٽ� �����ϰ�
		//53���� �ٽ� �����ؾ� �Ǵ°ǰ�?
		//������ ī�� ���̿� �ʺ� �� �ٲٸ� �ȵǳ�? 53�� ���� �۾��� �ݺ��ؾ� �Ѵ�.

	}

}
