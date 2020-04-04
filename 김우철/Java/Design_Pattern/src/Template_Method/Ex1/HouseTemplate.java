package Template_Method.Ex1;

public abstract class HouseTemplate {

	// final �������� Override ����
	public final void buildHouse() {
		buildFoundation();
		buildPillars();
		buildWalls();
		buildWindows();
		System.out.println("House is built");
	}

	// �⺻���� ����
	private void buildWindows() {
		System.out.println("Building Glass Windows");
	}

	// ����Ŭ�������� ���� ���� �� �޼ҵ�
	public abstract void buildWalls();
	public abstract void buildPillars();

	private void buildFoundation() {
		System.out.println("Building foundation with cement,iron rods and sand");
	}

}
