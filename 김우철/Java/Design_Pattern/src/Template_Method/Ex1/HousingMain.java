//https://niceman.tistory.com/142

package Template_Method.Ex1;

public class HousingMain {
	public static void main(String[] args) {
		
		//템플릿 메소드 사용(Wooden House)
		HouseTemplate houseType = new WoodenHouse();
		houseType.buildHouse();
		
		//구분 선 삽입
		System.out.println();
		System.out.println("*******");
		System.out.println();
		
		//템플릿 메소드 사용(Glass House)
		houseType = new GlassHouse();
		houseType.buildHouse();
	}
}
