import kr.or.bit.Book;

public class Ex16_Book_S {

	public static void main(String[] args) {
		Book b = new Book(12000 , "�ó�������?");
		
		Book b2 = new Book(15000 , "����ΰ�?");
		
		b.bookNamePrice();
		b2.bookNamePrice();

		//		int result = b.getClass();
//		int result = b.getName();
		
		System.out.println(b.getName());
		System.out.println(b.getPrice());
		
	}

}
