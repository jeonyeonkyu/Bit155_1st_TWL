
public class MAIN {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		System.out.println("메소드 오버로딩 복습");
		
		Calculator cal = new Calculator();
		
		System.out.println("1. String형 매개변수");
		cal.sum("8,14");		
		System.out.println("2. int형 매개변수, int형 매개변수");
		cal.sum(8,14);
		System.out.println("3. int형 매개변수, String형 매개변수");
		cal.sum(8,"14");
		System.out.println("4. String형 매개변수, int형 매개변수");
		cal.sum("8",14);		
		System.out.println("5. String형 매개변수, String형 매개변수 ");
		cal.sum("8","14");
	}
	
	

}
