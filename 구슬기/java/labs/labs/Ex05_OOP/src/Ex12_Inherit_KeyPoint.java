/*
�ó�����(�䱸����)
����� ������ǰ ���� �ַ���� �����ϴ� ������Դϴ�
A��� ������ǰ ������ ���µǸ� 
[Ŭ���̾�Ʈ �䱸����]
������ǰ��  ��ǰ�� ���� , ��ǰ�� ����Ʈ ������ ���������� ������ �ֽ��ϴ�
������ ������ǰ�� ��ǰ�� ������ �̸��� ������ �ִ�
ex)
������ ������ǰ�� �̸��� ������ �ִ�(ex: Tv , Audio , Computer)
������ ������ǰ�� �ٸ� ������ ������ �ִ�(Tv:5000, Audio:6000 ....)
��ǰ�� ����Ʈ�� ������ 10% �����Ѵ�
 
�ùķ��̼� �ó�����
������ : ��ǰ�� �����ϱ� ���� �ݾ����� , ����Ʈ ������ ������ �ִ� 
���� ��� : 10����  , ����Ʈ 0
�����ڴ� ��ǰ�� ������ �� �ִ� , ���������� �ϰԵǸ� ������ �ִ� ����  �����ϰ� ����Ʈ�� �ö󰣴�
�����ڴ� ó�� �ʱ� �ݾ��� ���� �� �ִ�
*/
//1�� ���� �׽�Ʈ ���� ����..
	//�Ͽ��� �ް� ... �����...
	
	//���Ŀ���
	//���忡 ��ǰ�� 1000���� �ٸ� ��ǰ�� ���Դ�.(��ǰ ��� : POS��� �ڵ�ȭ)
	//1000���� �ٸ� ��ǰ�� ��ġ�Ǿ��ִ�.
	//1. ���忡�� ������ 997���� ��ǰ�� �Ǹ� �� �� �������
	//   ������ 997���� ��ǰ�� ���� �� �� �ִ� ����� ������ �ʾҾ��.
	//2. ������ ����~ >> ���ͳݵǴ°� ã�� ���� >> ���߼��������� >> �ް� �Ⱓ���� 997���� �Լ��� ������ְԵ�.
	//   �� ����� ���� �ް��� ��..
	//��ȭ�� �������� ���Ѱ�.. �׷��� �ް��Ⱓ ���� ���� �Ѱ��̴�.
	
//��ȭ�� ���� �� �� �ִ� �ڵ带 ¥���Ѵ�.

	//�Ʒ��ڵ带 ��ſ� �ް��� ���� �� �ְ� ����������ϼ���.

class Buyer {
	int money = 1000;
	int bonuspoint;
	/*

	// �������� (���)
	// �������� (�ܾ� -��ǰ�� ����, ����Ʈ ���� ����)
	// **�����ڴ� ���忡 �ִ� ��� ������ ���� �� �� �ִ�.
	
	
	// ������ 3��...������ �� �ִ� ���3��
	void kttvBuy(KtTv n) {// �Լ��� ��ǰ ��ü�� parameter�� �޾Ƽ� (����, ����Ʈ ������ ����)
		if (this.money < n.price) {
			System.out.println("���� �ܾ��� �����մϴ�^^ " + this.money);
			return; // �Լ����� > kttvBuy Ż�� (�������� ����)
		}
		// �� ���� ����
		this.money -= n.price; // �ܾ�
		this.bonuspoint += n.bonuspoint; // ����
		System.out.println("������ ������ : " + n.toString());
	}

	void audioBuy(Audio n) {// �Լ��� ��ǰ ��ü�� parameter�� �޾Ƽ� (����, ����Ʈ ������ ����)
		if (this.money < n.price) {
			System.out.println("���� �ܾ��� �����մϴ�^^ " + this.money);
			return; // �Լ����� > kttvBuy Ż�� (�������� ����)
		}
		// �� ���� ����
		this.money -= n.price; // �ܾ�
		this.bonuspoint += n.bonuspoint; // ����
		System.out.println("������ ������ : " + n.toString());
	}

	void notebookBuy(NoteBook n) {// �Լ��� ��ǰ ��ü�� parameter�� �޾Ƽ� (����, ����Ʈ ������ ����)
		if (this.money < n.price) {
			System.out.println("���� �ܾ��� �����մϴ�^^ " + this.money);
			return; // �Լ����� > kttvBuy Ż�� (�������� ����)
		}
		// �� ���� ����
		this.money -= n.price; // �ܾ�
		this.bonuspoint += n.bonuspoint; // ����
		System.out.println("������ ������ : " + n.toString());
	}
	*/
	//2�� �ڵ� ���� (�����丵)
	//[�ϳ��� �̸�]���� �������� ���(method overloading)
//	void Buy(KtTv n) {// �Լ��� ��ǰ ��ü�� parameter�� �޾Ƽ� (����, ����Ʈ ������ ����)
//		if (this.money < n.price) {
//			System.out.println("���� �ܾ��� �����մϴ�^^ " + this.money);
//			return; // �Լ����� > kttvBuy Ż�� (�������� ����)
//		}
//		// �� ���� ����
//		this.money -= n.price; // �ܾ�
//		this.bonuspoint += n.bonuspoint; // ����
//		System.out.println("������ ������ : " + n.toString());
//	}
//
//	void Buy(Audio n) {// �Լ��� ��ǰ ��ü�� parameter�� �޾Ƽ� (����, ����Ʈ ������ ����)
//		if (this.money < n.price) {
//			System.out.println("���� �ܾ��� �����մϴ�^^ " + this.money);
//			return; // �Լ����� > kttvBuy Ż�� (�������� ����)
//		}
//		// �� ���� ����
//		this.money -= n.price; // �ܾ�
//		this.bonuspoint += n.bonuspoint; // ����
//		System.out.println("������ ������ : " + n.toString());
//	}
//
//	void Buy(NoteBook n) {// �Լ��� ��ǰ ��ü�� parameter�� �޾Ƽ� (����, ����Ʈ ������ ����)
//		if (this.money < n.price) {
//			System.out.println("���� �ܾ��� �����մϴ�^^ " + this.money);
//			return; // �Լ����� > kttvBuy Ż�� (�������� ����)
//		}
//		// �� ���� ����
//		this.money -= n.price; // �ܾ�
//		this.bonuspoint += n.bonuspoint; // ����
//		System.out.println("������ ������ : " + n.toString());
//	}
	//3�� �����ڵ� (�ߺ� �ڵ� ����) >>
	//��ǰ�� �߰� �Ǵ��� ���������� ��� �Ǿ�� �Ѵ�.
	//��? ��ſ� �ް��� ������ ���ؼ�.
	//��Ʈ �ϳ��� �̸����� �ݺ��ڵ带 �����ϰ� 
	
	//��� ��ǰ�� product�� ����ϰ� �ִ�.
	//��� ��ǰ�� �θ�� product��.
	//Product p;
	//Audio audio = new Audio();
	//p = audio �ּҸ� �������ִ�.
	//NoteBook notebook = new NoteBook
	//p= notebook point
	//�� �θ�͸� ������ �����ϴ�.
	//***toString() �ڽ��� ������....�θ� Ÿ������ ���� �ϴ���  �����Ƿ� �Ѿ��.
	//
	
	//�̰� �ϳ��� �������̴�..
	void Buy(Product n) {// �Լ��� ��ǰ ��ü�� parameter�� �޾Ƽ� (����, ����Ʈ ������ ����)
		//Product �� �޴� �ڽ�Ÿ���� �ּҴ� �� �޴°� �ƴ϶� �ּҸ� ���������� �����, �ٸ��� ������ �����ּҴ� �������. 
		if (this.money < n.price) {
			System.out.println("���� �ܾ��� �����մϴ�^^ " + this.money);
			return; // �Լ����� > kttvBuy Ż�� (�������� ����)
		}
		// �� ���� ����
		this.money -= n.price; // �ܾ�
		this.bonuspoint += n.bonuspoint; // ����
		System.out.println("������ ������ : " + n.toString());
		System.out.println("�ܾ� : "+ this.money);
		System.out.println("����Ʈ : "+ this.bonuspoint);
	}

}

class Product {
	int price;
	int bonuspoint;

	// Product() {
	// }
	Product(int price) {
		this.price = price;
		this.bonuspoint = (int) (this.price / 10.0);
	}
}

class KtTv extends Product { // KtTv kttv = new KtTv() >> ������ ������ �Է�
	KtTv() {
		super(500); // super Ÿ�� Product �ȿ� ���� �Ķ����1���ִ°� ã�ư��㿡 �����Ѵ�.
	}

	@Override
	public String toString() {
		return "KtTv"; // ���ڿ��� ��ȯ�ǰ� �س���!
	}

}

class Audio extends Product { // Audio audio = new Audio() >> ������ ������ �Է�
	Audio() {
		super(100);
	}

	@Override
	public String toString() {
		return "Audio";
	}
}

class NoteBook extends Product { // NoteBook notebook = new NoteBook() >> ������ ������ �Է�
	NoteBook() {
		super(150);
	}

	@Override
	public String toString() {
		return "NoteBook";
	}
}

public class Ex12_Inherit_KeyPoint {

	public static void main(String[] args) {
		KtTv kttv = new KtTv();
		System.out.println(kttv.toString());

		Audio audio = new Audio();
		System.out.println(audio.toString());
		
		NoteBook notebook = new NoteBook();
		System.out.println(notebook.toString());
		
		Buyer buyer = new Buyer(); //��
		
		//1�� ���� �׽�Ʈ
		//��������
		/*
		buyer.kttvBuy(kttv);
		buyer.notebookBuy(notebook);
        buyer.audioBuy(audio);
        buyer.kttvBuy(kttv);
        buyer.kttvBuy(kttv);
        */
		//2�� �����ڵ�
		buyer.Buy(kttv);
		buyer.Buy(notebook);
        buyer.Buy(audio);
        buyer.Buy(kttv);
        buyer.Buy(kttv);
        //3�� ���� �ڵ�
		
        
	}

}
