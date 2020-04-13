package Iterator_Pattern_Ex1;

public class BookShelfIterator implements Iterator {
	private BookShelf bookShelf;
	private int index;

	public BookShelfIterator(BookShelf bookShelf) {
		this.bookShelf = bookShelf;
		this.index = 0;
	}

	@Override
	public boolean hasNext() {
		 return bookShelf.getLength() > index ? true : false;
    }

	@Override
	public Object next() {
		   return bookShelf.getBookAt(index++);
    }

}
