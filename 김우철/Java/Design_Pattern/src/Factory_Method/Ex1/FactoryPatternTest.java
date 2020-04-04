//https://niceman.tistory.com/143?category=940951
//ä��

//https://biggwang.github.io/2019/06/28/Design%20Patterns/[Design%20Patterns]%20%ED%8C%A9%ED%86%A0%EB%A6%AC%20%ED%8C%A8%ED%84%B4,%20%EB%8F%84%EB%8C%80%EC%B2%B4%20%EC%99%9C%20%EC%93%B0%EB%8A%94%EA%B1%B0%EC%95%BC-%EA%B8%B0%EB%B3%B8%20%EC%9D%B4%EB%A1%A0%ED%8E%B8/
//���丮 �޼��� �߰� ����
package Factory_Method.Ex1;

public class FactoryPatternTest {
	public static void main(String[] args) {
		
		// ShapeFactory�� �̿����� �ʾ��� �� ����..
		Shape shape11 = new Circle();
		shape11.draw();

		Shape shape111 = new Circle();
		shape11.draw();

		Shape shape1111 = new Circle();
		shape11.draw();
		//���� ��� Circle��� Ŭ������ ���� ������ Rhombus(������)�� �ٲٰ� ���� ��
		//���� Circle 3���� �� �ٲ���� �Ѵ�.
		//�ٸ� Ŭ�������� Circle�� 3���� �ڵ尡 ������ �ű⵵ �ٲ���ߵ�.
		//������ ���丮 �޼��忡���� ���丮 Ŭ������ �ٲٸ� �ȴ�.
		
		ShapeFactory shapeFactory2 = new ShapeFactory();
		Shape shape11111 = shapeFactory2.getShape("RHOMBUS");
		//������ ���丮 Ŭ������ ����ϸ� ShapeFactory Ŭ������ ���ڸ� �Ѱ��־�
		//ShapeFactory Ŭ�������� ���� ������ �� �־� ȿ������ ���������� �����ϴ�
		//���. ��ü ������ ���� Ȯ�强�� ���� / ���յ��� ���� �������� ����
		
		
		// ���丮 Ŭ�������� ��ü�� ���� �� ��ȯ
		ShapeFactory shapeFactory = new ShapeFactory();

		Shape shape1 = shapeFactory.getShape("CIRCLE");

		// Circle �޼ҵ� ȣ��
		shape1.draw();

		Shape shape2 = shapeFactory.getShape("RECTANGLE");

		// Rectangel �޼ҵ� ȣ��
		shape2.draw();

		Shape shape3 = shapeFactory.getShape("SQUARE");

		// Square �޼ҵ� ȣ��
		shape3.draw();

	}
}
