import kr.or.bit.Fclass;
import kr.or.bit.NoteBook;

public class Ex02_Method {

	public static void main(String[] args) {
		Fclass fc = new Fclass();
		fc.m();
		
		fc.m2(10);
		
		int result = fc.m3();
		System.out.println(result);
		
		result = fc.m4(100);
		System.out.println(result);
		
		
		//1. fc.subSum() 호출여부
		fc.CallSubSum(); 
		
		result = fc.opSum(-1);
		System.out.println(result);
		
		//퍼블릭 자유롭게  프라이빗 내부에서
		//////////////////////////
		
		
		NoteBook nb = new NoteBook();
		nb.color = "red";
		nb.setYear(-2000);
		int rs = nb.getYear(); //캡슐화된것을 읽는 함수.
		System.out.println(rs);
		
		nb.setYear(2020);
		rs = nb.getYear();
		System.out.println(rs); 
		
		int result2 = fc.max(100, -50);
		System.out.println(result2);
			

	}

}
