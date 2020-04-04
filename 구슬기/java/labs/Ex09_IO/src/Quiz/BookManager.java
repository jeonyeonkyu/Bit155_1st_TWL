package Quiz;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

//���� ������ Ŭ����

import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

public class BookManager {

	Scanner scan = new Scanner(System.in);

	static HashMap<String, Book> book_dic = new HashMap<String, Book>();

	public void Run() {

		int key = 0;

		while ((key = selectMenu()) != 0) {

			switch (key) {

			case 1:
				addBook();
				break;

			case 2:
				removeBook();
				break;

			case 3:
				searchBook();
				break;

			case 4:
				listBook();
				break;

			case 5:
				listISBN();
				break;
				
			case 6:
				listSave();
				break;
				
			case 7:
				listLoad();
				break;
				
			default:
				System.out.println("�߸� �����Ͽ����ϴ�.");
				break;

			}

		}

		System.out.println("�����մϴ�...");

	}
	
	//���Ͽ� ������ 
	void listSave() {
		File file = new File("Booklist.txt"); 
		try{
			FileOutputStream fos = new FileOutputStream(file);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			
			oos.writeObject(book_dic); //book_dic �ִ� ��ü�� ���Ͽ� �����Ѵ� 
			
			oos.close();
			//bos.close();
			fos.close();
			
			System.out.println("����Ǿ����ϴ�.");
			
		}catch(Exception e){
			System.out.println("�����߻�!!!");
			e.printStackTrace();
		}finally {
			
		}
		
	}
	
	//���Ͽ� ����� ���� �ҷ����� ��� ������ 
	void listLoad() {
		File file = new File("Booklist.txt"); 
		try{
			FileInputStream fos = new FileInputStream(file);
			BufferedInputStream bos = new BufferedInputStream(fos);
			ObjectInputStream oos = new ObjectInputStream(fos);
			
			//oos.readObject(); //book_dic �ִ� ��ü�� ���Ͽ� �����Ѵ� 
			
			book_dic = (HashMap)oos.readObject(); //Object Ÿ������ �о HashMap Ÿ������ �ٿ�ĳ���� ������� ���� 
			
			Set<String> set = book_dic.keySet();
			
			for (String number : set) {
				System.out.println(book_dic.get(number).toString());
			}
			
		
			oos.close();
			bos.close();
			fos.close();
			
			System.out.println("�ҷ���");
			
		}catch(Exception e){
			System.out.println("�����߻�!!!");
			e.printStackTrace();
		}finally {
			
		}
	}
	
	int selectMenu() {

		System.out.println("1:�߰� 2:���� 3:�˻� 4:���� ��� 5:ISBN ���0 6:���� 7:�ε� ,����(0)");

		int key = scan.nextInt();

		scan.nextLine();

		return key;

	}

	void addBook() {

		String isbn;

		System.out.print("�߰��� ���� ISBN:");

		isbn = scan.nextLine();

		if (book_dic.containsKey(isbn)) {

			System.out.println("�̹� �����ϴ� ISBN�Դϴ�.");

			return;

		}

		String title;

		int price;

		System.out.print("���� ����:");

		title = scan.nextLine();

		System.out.print("����:");

		price = scan.nextInt();

		scan.nextLine();

		Book book = new Book(isbn, title, price);

		book_dic.put(isbn, book);

		System.out.println(book.toString() + " �����Ͽ����ϴ�.");

	}

	void removeBook() {

		String isbn;

		System.out.print("������ ���� ISBN:");

		isbn = scan.nextLine();

		if (book_dic.containsKey(isbn)) {

			book_dic.remove(isbn);

			System.out.println("�����Ͽ����ϴ�.");

		}

		else {

			System.out.println("�������� �ʽ��ϴ�.");

		}

	}

	void searchBook() {

		String isbn;

		System.out.print("�˻��� ���� ISBN:");

		isbn = scan.nextLine();

		if (book_dic.containsKey(isbn)) {

			Book book = book_dic.get(isbn);

			System.out.println("�˻� ���>>" + book.toString());

		}

		else {

			System.out.println("�������� �ʽ��ϴ�.");

		}

	}

	void listBook() {

		System.out.println("���� ���");

		int cnt = book_dic.size();

		System.out.println("���� ��:" + cnt);

		for (Book book : book_dic.values()) {

			System.out.println(book.toString());

		}

	}

	void listISBN() {

		System.out.println("ISBN ���");

		int cnt = book_dic.size();

		System.out.println("���� ��:" + cnt);

		for (String isbn : book_dic.keySet()) {

			System.out.println(isbn);

		}

	}

}