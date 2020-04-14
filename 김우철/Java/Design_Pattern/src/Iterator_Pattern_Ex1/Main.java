//https://egipyo21.tistory.com/27
//http://www.incodom.kr/%EC%9D%B4%ED%84%B0%EB%A0%88%EC%9D%B4%ED%84%B0_%ED%8C%A8%ED%84%B4
package Iterator_Pattern_Ex1;

public class Main {
	public static void main(String[] args) {
		BookShelf bookShelf = new BookShelf(4);
		bookShelf.addBook(new Book("A"));
		bookShelf.addBook(new Book("B"));
		bookShelf.addBook(new Book("C"));
		bookShelf.addBook(new Book("D"));

		Iterator iterator = bookShelf.iterator();

		while (iterator.hasNext()) {
			Book book = (Book) iterator.next();
			System.out.println(book.getName());
		}
	}

}