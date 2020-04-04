//https://niceman.tistory.com/142

package Template_Method.Ex1;

public class HousingMain {
	public static void main(String[] args) {
		
		//���ø� �޼ҵ� ���(Wooden House)
		HouseTemplate houseType = new WoodenHouse();
		houseType.buildHouse();
		
		//���� �� ����
		System.out.println();
		System.out.println("*******");
		System.out.println();
		
		//���ø� �޼ҵ� ���(Glass House)
		houseType = new GlassHouse();
		houseType.buildHouse();
	}
}
