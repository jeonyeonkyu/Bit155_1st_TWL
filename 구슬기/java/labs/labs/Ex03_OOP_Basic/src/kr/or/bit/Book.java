package kr.or.bit;
/*
 책은 책이름을 가지고 있고 가격을 가지고 있다
 책이 출판되면 반드시 책이름과 책의 가격을 가지고 있어야한다
 책의 이름과 가격 정보는 특정 기능을 통해서만 볼 수 있고, 출판 된 이후에서 수정할 수 없다.
 책 이름과 가격정보는 각각확인 할 수 있다.
 */
public class Book {
	private String name;
	private int price;
	
	public Book(int price, String name) {
		this.price = price;
		this.name = name;   //점점이뻐지고 있다..
		
	}

	public String getName() {
		return name;
	}

	
	public int getPrice() {
		return price;
	}

	
	public void bookNamePrice() {
		System.out.printf("이름:[%s] 가격:[%d]\n",name ,price);
	}
	
	
	




}



