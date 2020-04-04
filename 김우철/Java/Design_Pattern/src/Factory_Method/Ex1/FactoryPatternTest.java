//https://niceman.tistory.com/143?category=940951
//채택

//https://biggwang.github.io/2019/06/28/Design%20Patterns/[Design%20Patterns]%20%ED%8C%A9%ED%86%A0%EB%A6%AC%20%ED%8C%A8%ED%84%B4,%20%EB%8F%84%EB%8C%80%EC%B2%B4%20%EC%99%9C%20%EC%93%B0%EB%8A%94%EA%B1%B0%EC%95%BC-%EA%B8%B0%EB%B3%B8%20%EC%9D%B4%EB%A1%A0%ED%8E%B8/
//팩토리 메서드 추가 설명
package Factory_Method.Ex1;

public class FactoryPatternTest {
	public static void main(String[] args) {
		
		// ShapeFactory를 이용하지 않았을 때 예시..
		Shape shape11 = new Circle();
		shape11.draw();

		Shape shape111 = new Circle();
		shape11.draw();

		Shape shape1111 = new Circle();
		shape11.draw();
		//예를 들어 Circle라는 클래스를 새로 생성한 Rhombus(마름모)로 바꾸고 싶을 때
		//위의 Circle 3개를 다 바꿔줘야 한다.
		//다른 클래에서도 Circle의 3개의 코드가 있으면 거기도 바꿔줘야됨.
		//하지만 팩토리 메서드에서는 팩토리 클래스만 바꾸면 된다.
		
		ShapeFactory shapeFactory2 = new ShapeFactory();
		Shape shape11111 = shapeFactory2.getShape("RHOMBUS");
		//하지만 팩토리 클래스를 사용하면 ShapeFactory 클래스에 인자를 넘겨주어
		//ShapeFactory 클래스에서 쉽게 관리할 수 있어 효율적인 유지보수가 가능하다
		//요약. 객체 생성에 관한 확장성이 용이 / 결합도를 낮춰 유지보수 용이
		
		
		// 팩토리 클래스에서 객체를 생성 후 반환
		ShapeFactory shapeFactory = new ShapeFactory();

		Shape shape1 = shapeFactory.getShape("CIRCLE");

		// Circle 메소드 호출
		shape1.draw();

		Shape shape2 = shapeFactory.getShape("RECTANGLE");

		// Rectangel 메소드 호출
		shape2.draw();

		Shape shape3 = shapeFactory.getShape("SQUARE");

		// Square 메소드 호출
		shape3.draw();

	}
}
