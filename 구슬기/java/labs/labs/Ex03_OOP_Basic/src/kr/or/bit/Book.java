package kr.or.bit;
/*
 å�� å�̸��� ������ �ְ� ������ ������ �ִ�
 å�� ���ǵǸ� �ݵ�� å�̸��� å�� ������ ������ �־���Ѵ�
 å�� �̸��� ���� ������ Ư�� ����� ���ؼ��� �� �� �ְ�, ���� �� ���Ŀ��� ������ �� ����.
 å �̸��� ���������� ����Ȯ�� �� �� �ִ�.
 */
public class Book {
	private String name;
	private int price;
	
	public Book(int price, String name) {
		this.price = price;
		this.name = name;   //�����̻����� �ִ�..
		
	}

	public String getName() {
		return name;
	}

	
	public int getPrice() {
		return price;
	}

	
	public void bookNamePrice() {
		System.out.printf("�̸�:[%s] ����:[%d]\n",name ,price);
	}
	
	
	




}



