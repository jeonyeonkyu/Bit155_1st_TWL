//https://readystory.tistory.com/119
//채택.

//https://jhparkkk.tistory.com/5
//팩토리 메서드의 단점 -> 추상 팩토리로 극복

package Abstract_Factory.Ex3;

public class AbstractFactoryTest {
	public static void main(String[] args) {
		ComputerFactory.getComputer(new PCFactory("인텔CPU", "인텔VGA"));
		ComputerFactory.getComputer(new ServerFactory("라이젠CPU", "라이젠Vga"));
		
	}
}

/*장점
1.추후 sub class를 확장하는 데 있어 굉장히 쉽게 할 수 있음
만약 Laptop 클래스를 추가하고자 한다면 getComputer() 수정없이 LaptopFactory만 작성하면 됨
2.팩토리 패턴의 조건문(if-else, switch 등)으로부터 벗어남.
*/