
public class Ex1 {
	public static void main (String[] args){
		
		System.out.println("메소드 오버로딩 복습");
		Calculator lo = new Calculator();
		lo.sum("8,14");
		lo.sum(8,14);
		lo.sum("8",14);
		lo.sum(8,"14");
		lo.sum("8","14");
		
}
}