/*
 
 설계도 1개,,, 업무가 복잡하지 않으면...
 업무가 복잡해지면 ...1개 이상의 설계도 제작
 고민> 쇼핑몰> 회원관리, 주문관리, 배송관리...설계도 5장... 독립적으로도 쓰일수 있지만 다른 설계도와 관계를 가질수도있다.
 **기준점** 설계도들의 (관계)를 맺어주는것.
 
 *여러개의 설계도를 가지고 관계를 맺어주는 방법 2가지
 *1.상속관계  2.포함관계
 (상속 ,포함)은 타입이아니라 클래스 간의 관계이다.
 
 ****80% 정도의 정확성을 가지고있는 구분 방법!****   
  1.상속 관계 (is ~a: 은 ~이다 (부모를 뒤에) 하고 일반적인 상식으로 정의가 된다면 상속)
  
  2.포함 관계(has ~a: 은 ~을 가지고 있다.  상속)
  
  예외적인 사항을 보내며 시행착오를 보낸사람.    프로젝트 몇개했다 o     연차 몇년이다 x   IT는 내가 어떤 프로젝트에서 어떤 일을 했느냐가 경력임. 
  면접에서도 프로젝트 뭐했냐고 물어본다. 
  보통 프로젝트 주제는 자기가 아는거 == 잘할수있는것.
  업무를 알아야 잘 짠다. 도메인 지식이 무기가 된당. 첫 직장이 중요한 이유임.
  중간에 길을 바꾸려면 연봉이 깎인다. 도메인지식이 다르기때문이다.  우리의 자산은 도메인지식.  법학과는 법률지식 이런식으로 비전공자들의 지식은 도움이 된다. 
  어떤사람은 부동산쪽 취업을 위해 공인중개사 자격증 + 개발자가 되었다.
  
  예)
         원 클래스   도형클래스    -원은 도형이다.o   원은 도형을 가지고 있다.  x
         >> 원  extends 도형 (상속관계)
         
         원 클래스  점 클래스       -원은 점이다.x     원은 점을 가지고 있다.o
         >>has ~a (member field)     
         >> class 원{점 변수명} 
         
         
         경찰클래스   총클래스      -경찰은 총이다.x   경찰은 총을 가지고 있다.  o
         >>  경찰
         >> class 경찰{권총 변수명}
         
     ex)원, 삼각형, 사각형 만드는 설계도를 작성
   
                원은 도형이다.
                삼각형은 도형이다.
                사각형은 도형이다.
                
                       도형: 추상화된 자원(자원이지닌 특수성이 아닌 공통점에 집중한다.), 일반화(그리다, 색상) >> 공통자원
                       원 : 구체화, 특수화 (원만 가지는 특성을 찾아야함)  >> 반지름, 점  .   등 본인만이 가지는 특징. 그게아니면 공통자원이어야함.
                       점 : 좌표값(x,y)
                       원은 점을 가지고 있다.
                       삼각형은 점을 가지고 있다.
                       사각형은 점을 가지고 있다.
                       
 class Shape : 일반화, 추상화, 공통(그리다.색상) >>상속관계  
 class Point : 구체화, 특수화, (점)           >>포함관계

                       구체화, 특수화:circle, triangle
                       
                       
         
 */
//추상화, 일반화, 공통점을 가진 클래스를 먼저 만듦! 부모클래스를 먼저 만들어야되니까.
class Shape {
	String color = "gold"; // 공통속성

	void draw() { //공통기능
		System.out.println("그리다");
	}
}

//공통
class Point {
	int x;
	int y;

	Point() { // 점 값을 입력하지 않으면 기본적으로 이값으로 초기화시킴
//		this.x=1;
//		this.y=1;
		this(10, 15);
	}

	Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
}

class Circle extends Shape { // 상속관계    //Circle is a Shape. (상속관계)
	Point point; // 포함관계(member field)  //Circle has a point.(포함관계)
	int r;// 반지름(특수성)

	Circle() {
//		this.r = 10;
//		this.point = new Point(10,15);
		this(10, new Point(10, 15)); // 이렇게 하면 10과 함께 주소값을 넘겨 줄 수 있다.
	}

	Circle(int r, Point point) { // 반지름, 점값을 임의로..
		this.r = r;
		this.point = point; // 주소값 할당
	}

}
//Circle circle = new Circle()
//Circle circle = new Circle(15,new Point(10,15));

//문제 : 원을 만드세요 (원의 정의 : 원은 한점과 반지름을 가지고 있다.)
//1. 원은 도형이다 (is~ a) :도형(shape)
//2. 원은 점을 가지고 있다. (has ~a) :점(point)
//3. 원은 반지름을 가지고 있다(특수성) : r
//원의 반지름은 default 값으로 10을 가진다
//점의 x,y좌표는 default 로(10,15)
//기본값을 성정하지 않으면 바지름과 점의 값을 입력받을 수 있다.(원이 만들어질때)

/*
 * 문제2) 삼각형 클래스를 만드세요.
 * 삼각형 클래스를 만드세요.
 * 정의) 삼각형은 3개의 점과 색과 그리고 그리다라는 기능을 가지고 있다.
 * shape, point 제공받아요
 * hint) (x,y)(x,y)(x,y) 3개의 좌표값
 * default 로 그릴 수 있고, 3개의 좌표값을 받아서 그릴 수 있다.
 * 
 */

class Triangle extends Shape {
	Point x;
	Point y;
	Point z;

	Triangle() { // default 생성자로 그리면 요렇게 생성이 된다.

		this(new Point(10, 20), new Point(30, 40), new Point(50, 60));
	}

	Triangle(Point x, Point y, Point z) {// 파라메터로 배열의 주소값을 받는다.
		this.x = x; //주소값
		this.y = y;
		this.z = z;
	}
	//구체화 특수화
	//추가적인 기능

	void trianglePoint() {
		System.out.printf("x :(%d%d)\t", x.x, x.y);
		System.out.printf("x :(%d%d)\t", y.x, y.y);
		System.out.printf("x :(%d%d)\t", z.x, z.y);
	}
}

/////////////////////////////////////////////////////////////////
//배열 넣은 트라이 앵글 이다.	
//상속 배열
//디스 오버로딩 다 포함된거임.
class Triangle2 extends Shape {
	Point[] pointarray;

	// Point x; //int x, int y 쉐이프 안에 좌표값이 들어있다.
//	Point y;
//	Point z;
	Triangle2() { // default 생성자로 그리면 요렇게 생성이 된다.
//		pointarray = new Point[3]; //방만... 방안을 채워줘야한다.
//		pointarray[0] = new Point(10,20);
//		pointarray[1] = new Point(30,40);
//		pointarray[2] = new Point(50,60);
//	안돼영>>	pointarray = {new Point(10,20),new Point(30,40),new Point(50,60)}

		this(new Point[] { new Point(10, 20), new Point(30, 40), new Point(50, 60) });
	}

	Triangle2(Point[] pointarray) {// 파라메터로 배열의 주소값을 받는다.
		this.pointarray = pointarray; // 이렇게하면 포인트 배열의 주소값을 할당한다.
	}

	// 구체화, 특수화 된걸 만들어보자
	// 추가적인 기능
	void trianglePoint() {
		for (Point point : this.pointarray) {
			System.out.printf("point : (%d,%d)\t", point.x, point.y);
		    System.out.println();
		}
	}
}


//사각형 만들어 보세요.

class Square extends Shape{
	Point v;
	Point x;
	Point y;
	Point z;
	
	Square(){
		this(new Point(1,1),new Point(2,2),new Point(3,3),new Point(4,4));
	}
	Square(Point v,Point x,Point y, Point z){
		this.v = v;
		this.x = x;
		this.y = y;
		this.z = z;
	}
	
	void squarePrint() {
		System.out.printf("v : (%d,%d)\t" , v.x,v.y);
		System.out.printf("x : (%d,%d)\t" , x.x,x.y);
		System.out.printf("y : (%d,%d)\t" , y.x,y.y);
		System.out.printf("z : (%d,%d)\t" , z.x,z.y);
	}
}






public class Ex02_Inherit_Composition { // 이해하고 사고하는 영역의 시작.

	public static void main(String[] args) {
		Circle circle = new Circle();
		System.out.println("반지름: " + circle.r);
		System.out.println("부모: " + circle.color);
		System.out.println("좌표: " + circle.point.x);
		System.out.println("좌표: " + circle.point.y);
		circle.draw();

		Circle circle2 = new Circle(20, new Point(2, 5));
		System.out.println("반지름: " + circle2.r);
		System.out.println("부모: " + circle2.color);
		System.out.println("좌표: " + circle2.point.x);
		System.out.println("좌표: " + circle2.point.y);
		circle2.draw();

		
		//////////////////////////////////////////////////////
		
		
		Triangle triangle = new Triangle();
		triangle.trianglePoint();
		triangle.draw();

		// 기본값 아닌것
		Point[] pointarray = { new Point(11, 21), new Point(31, 41), new Point(51, 61) }; // 이건 내가 원하는 대로 그린것.
		Triangle2 triangle3 = new Triangle2(pointarray);
		triangle3.trianglePoint();
		
		
		///////////////////////////////////////////////////////
		
		
		Square s = new Square();
		System.out.println();
		s.squarePrint();
		s.draw();
	}

}
