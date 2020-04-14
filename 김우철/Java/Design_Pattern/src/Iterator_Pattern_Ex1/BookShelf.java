package Iterator_Pattern_Ex1;

public class BookShelf implements Aggregate{
	
	private Book[] books;
	private int last = 0;
	
	public BookShelf(int max) {
		books = new Book[max];
	}
	
	public void addBook(Book book) {
		books[last++] = book;
	}
	
	public Book getBookAt(int index) {
		return books[index];
	}
	
	public int getLength() {
		return last;
	}
	
	@Override
	public Iterator iterator() {
		return new BookShelfIterator(this);
	}

}