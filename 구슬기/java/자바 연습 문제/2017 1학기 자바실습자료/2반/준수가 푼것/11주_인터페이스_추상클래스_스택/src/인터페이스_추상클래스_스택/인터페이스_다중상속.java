package 인터페이스_추상클래스_스택;
import java.util.Scanner;
public class 인터페이스_다중상속 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Book[] information = new Book[3];
		boolean flag=true;
		information[0]= new KoreanBook("준수","계란 깨졌다","창공 낙하실험 계란 다깨짐 ㅎㅎㅎㅋ");
		information[1]= new EnglishBook("Byun Woon-Jo","English TextBook","Java is a programming language and computing platform first released by Sun Microsystems in 1995.");
		information[2]= new MathBook("수학천재","수치해석","A+B=B+A [행렬 덧셈의 교환법칙]\nA+(B+C)=(A+B)+C [행렬 덧셈의 결합법칙]");
		while(flag){
			System.out.println("\n보고 싶은 책 고르시오.");
			System.out.println("1 : 국어 교과서");
			System.out.println("2 : 영어 교과서");
			System.out.println("3 : 수학 교과서");
			System.out.println("0 : 종료");
			System.out.print("번호 입력 : ");
			int a = sc.nextInt();
			switch(a){
				case 0:
					flag=false;
					break;
				case 1:
					System.out.println("****** "+ a + "번째 책 " + "******");
					information[a-1].printWriter();
					information[a-1].printTitle();
					information[a-1].printContent();
					break;
				case 2:
					System.out.println("****** "+ a + "번째 책 " + "******");
					information[a-1].printWriter();
					information[a-1].printTitle();
					information[a-1].printContent();
					break;
				case 3:
					System.out.println("****** "+ a + "번째 책 " + "******");
					information[a-1].printWriter();
					information[a-1].printTitle();
					information[a-1].printContent();
					break;
				default :
					System.out.println("잘못 입력하셨습니다.");
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
		System.out.println("저자 : "+name);
	}
	public void printTitle(){
		System.out.println("제목 : "+book);
	}
	public void printContent(){
		System.out.println("책 내용\n"+in);
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
		System.out.println("저자 : "+name);
	}
	public void printTitle(){
		System.out.println("제목 : "+book);
	}
	public void printContent(){
		System.out.println("책 내용\n"+in);
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
		System.out.println("저자 : "+name);
	}
	public void printTitle(){
		System.out.println("제목 : "+book);
	}
	public void printContent(){
		System.out.println("책 내용\n"+in);
	}
}