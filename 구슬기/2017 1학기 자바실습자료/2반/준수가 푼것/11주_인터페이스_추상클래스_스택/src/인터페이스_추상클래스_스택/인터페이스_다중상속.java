package �������̽�_�߻�Ŭ����_����;
import java.util.Scanner;
public class �������̽�_���߻�� {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Book[] information = new Book[3];
		boolean flag=true;
		information[0]= new KoreanBook("�ؼ�","��� ������","â�� ���Ͻ��� ��� �ٱ��� ��������");
		information[1]= new EnglishBook("Byun Woon-Jo","English TextBook","Java is a programming language and computing platform first released by Sun Microsystems in 1995.");
		information[2]= new MathBook("����õ��","��ġ�ؼ�","A+B=B+A [��� ������ ��ȯ��Ģ]\nA+(B+C)=(A+B)+C [��� ������ ���չ�Ģ]");
		while(flag){
			System.out.println("\n���� ���� å ���ÿ�.");
			System.out.println("1 : ���� ������");
			System.out.println("2 : ���� ������");
			System.out.println("3 : ���� ������");
			System.out.println("0 : ����");
			System.out.print("��ȣ �Է� : ");
			int a = sc.nextInt();
			switch(a){
				case 0:
					flag=false;
					break;
				case 1:
					System.out.println("****** "+ a + "��° å " + "******");
					information[a-1].printWriter();
					information[a-1].printTitle();
					information[a-1].printContent();
					break;
				case 2:
					System.out.println("****** "+ a + "��° å " + "******");
					information[a-1].printWriter();
					information[a-1].printTitle();
					information[a-1].printContent();
					break;
				case 3:
					System.out.println("****** "+ a + "��° å " + "******");
					information[a-1].printWriter();
					information[a-1].printTitle();
					information[a-1].printContent();
					break;
				default :
					System.out.println("�߸� �Է��ϼ̽��ϴ�.");
			}
		}
	
	
	}

}




interface Book {
	void printWriter();
	void printTitle();
	void printContent();
}

class KoreanBook implements Book{
	String name;
	String book;
	String in;
	public KoreanBook(String name, String book, String in){
		this.name=name;
		this.book=book;
		this.in=in;
		
	}
	public void printWriter(){
		System.out.println("���� : "+name);
	}
	public void printTitle(){
		System.out.println("���� : "+book);
	}
	public void printContent(){
		System.out.println("å ����\n"+in);
	}
}
class EnglishBook implements Book{
	String name;
	String book;
	String in;
	public EnglishBook(String name, String book, String in){
		this.name=name;
		this.book=book;
		this.in=in;
	}
	public void printWriter(){
		System.out.println("���� : "+name);
	}
	public void printTitle(){
		System.out.println("���� : "+book);
	}
	public void printContent(){
		System.out.println("å ����\n"+in);
	}
}
class MathBook implements Book{
	String name;
	String book;
	String in;
	public MathBook(String name, String book, String in){
		this.name=name;
		this.book=book;
		this.in=in;
	}
	public void printWriter(){
		System.out.println("���� : "+name);
	}
	public void printTitle(){
		System.out.println("���� : "+book);
	}
	public void printContent(){
		System.out.println("å ����\n"+in);
	}
}