package Template_Method.Ex1;

public abstract class HouseTemplate {

	// final 선언으로 Override 방지
	public final void buildHouse() {
		buildFoundation();
		buildPillars();
		buildWalls();
		buildWindows();
		System.out.println("House is built");
	}

	// 기본으로 구현
	private void buildWindows() {
		System.out.println("Building Glass Windows");
	}

	// 서브클래스에서 직접 구현 할 메소드
	public abstract void buildWalls();
	public abstract void buildPillars();

	private void buildFoundation() {
		System.out.println("Building foundation with cement,iron rods and sand");
	}

}
