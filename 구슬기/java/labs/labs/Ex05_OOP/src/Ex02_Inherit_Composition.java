/*
 
 ���赵 1��,,, ������ �������� ������...
 ������ ���������� ...1�� �̻��� ���赵 ����
 ���> ���θ�> ȸ������, �ֹ�����, ��۰���...���赵 5��... ���������ε� ���ϼ� ������ �ٸ� ���赵�� ���踦 ���������ִ�.
 **������** ���赵���� (����)�� �ξ��ִ°�.
 
 *�������� ���赵�� ������ ���踦 �ξ��ִ� ��� 2����
 *1.��Ӱ���  2.���԰���
 (��� ,����)�� Ÿ���̾ƴ϶� Ŭ���� ���� �����̴�.
 
 ****80% ������ ��Ȯ���� �������ִ� ���� ���!****   
  1.��� ���� (is ~a: �� ~�̴� (�θ� �ڿ�) �ϰ� �Ϲ����� ������� ���ǰ� �ȴٸ� ���)
  
  2.���� ����(has ~a: �� ~�� ������ �ִ�.  ���)
  
  �������� ������ ������ ���������� �������.    ������Ʈ ��ߴ� o     ���� ����̴� x   IT�� ���� � ������Ʈ���� � ���� �ߴ��İ� �����. 
  ���������� ������Ʈ ���߳İ� �����. 
  ���� ������Ʈ ������ �ڱⰡ �ƴ°� == ���Ҽ��ִ°�.
  ������ �˾ƾ� �� §��. ������ ������ ���Ⱑ �ȴ�. ù ������ �߿��� ������.
  �߰��� ���� �ٲٷ��� ������ ���δ�. ������������ �ٸ��⶧���̴�.  �츮�� �ڻ��� ����������.  ���а��� �������� �̷������� �������ڵ��� ������ ������ �ȴ�. 
  ������ �ε����� ����� ���� �����߰��� �ڰ��� + �����ڰ� �Ǿ���.
  
  ��)
         �� Ŭ����   ����Ŭ����    -���� �����̴�.o   ���� ������ ������ �ִ�.  x
         >> ��  extends ���� (��Ӱ���)
         
         �� Ŭ����  �� Ŭ����       -���� ���̴�.x     ���� ���� ������ �ִ�.o
         >>has ~a (member field)     
         >> class ��{�� ������} 
         
         
         ����Ŭ����   ��Ŭ����      -������ ���̴�.x   ������ ���� ������ �ִ�.  o
         >>  ����
         >> class ����{���� ������}
         
     ex)��, �ﰢ��, �簢�� ����� ���赵�� �ۼ�
   
                ���� �����̴�.
                �ﰢ���� �����̴�.
                �簢���� �����̴�.
                
                       ����: �߻�ȭ�� �ڿ�(�ڿ������� Ư������ �ƴ� �������� �����Ѵ�.), �Ϲ�ȭ(�׸���, ����) >> �����ڿ�
                       �� : ��üȭ, Ư��ȭ (���� ������ Ư���� ã�ƾ���)  >> ������, ��  .   �� ���θ��� ������ Ư¡. �װԾƴϸ� �����ڿ��̾����.
                       �� : ��ǥ��(x,y)
                       ���� ���� ������ �ִ�.
                       �ﰢ���� ���� ������ �ִ�.
                       �簢���� ���� ������ �ִ�.
                       
 class Shape : �Ϲ�ȭ, �߻�ȭ, ����(�׸���.����) >>��Ӱ���  
 class Point : ��üȭ, Ư��ȭ, (��)           >>���԰���

                       ��üȭ, Ư��ȭ:circle, triangle
                       
                       
         
 */
//�߻�ȭ, �Ϲ�ȭ, �������� ���� Ŭ������ ���� ����! �θ�Ŭ������ ���� �����ߵǴϱ�.
class Shape {
	String color = "gold"; // ����Ӽ�

	void draw() { //������
		System.out.println("�׸���");
	}
}

//����
class Point {
	int x;
	int y;

	Point() { // �� ���� �Է����� ������ �⺻������ �̰����� �ʱ�ȭ��Ŵ
//		this.x=1;
//		this.y=1;
		this(10, 15);
	}

	Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
}

class Circle extends Shape { // ��Ӱ���    //Circle is a Shape. (��Ӱ���)
	Point point; // ���԰���(member field)  //Circle has a point.(���԰���)
	int r;// ������(Ư����)

	Circle() {
//		this.r = 10;
//		this.point = new Point(10,15);
		this(10, new Point(10, 15)); // �̷��� �ϸ� 10�� �Բ� �ּҰ��� �Ѱ� �� �� �ִ�.
	}

	Circle(int r, Point point) { // ������, ������ ���Ƿ�..
		this.r = r;
		this.point = point; // �ּҰ� �Ҵ�
	}

}
//Circle circle = new Circle()
//Circle circle = new Circle(15,new Point(10,15));

//���� : ���� ���弼�� (���� ���� : ���� ������ �������� ������ �ִ�.)
//1. ���� �����̴� (is~ a) :����(shape)
//2. ���� ���� ������ �ִ�. (has ~a) :��(point)
//3. ���� �������� ������ �ִ�(Ư����) : r
//���� �������� default ������ 10�� ������
//���� x,y��ǥ�� default ��(10,15)
//�⺻���� �������� ������ �������� ���� ���� �Է¹��� �� �ִ�.(���� ���������)

/*
 * ����2) �ﰢ�� Ŭ������ ���弼��.
 * �ﰢ�� Ŭ������ ���弼��.
 * ����) �ﰢ���� 3���� ���� ���� �׸��� �׸��ٶ�� ����� ������ �ִ�.
 * shape, point �����޾ƿ�
 * hint) (x,y)(x,y)(x,y) 3���� ��ǥ��
 * default �� �׸� �� �ְ�, 3���� ��ǥ���� �޾Ƽ� �׸� �� �ִ�.
 * 
 */

class Triangle extends Shape {
	Point x;
	Point y;
	Point z;

	Triangle() { // default �����ڷ� �׸��� �䷸�� ������ �ȴ�.

		this(new Point(10, 20), new Point(30, 40), new Point(50, 60));
	}

	Triangle(Point x, Point y, Point z) {// �Ķ���ͷ� �迭�� �ּҰ��� �޴´�.
		this.x = x; //�ּҰ�
		this.y = y;
		this.z = z;
	}
	//��üȭ Ư��ȭ
	//�߰����� ���

	void trianglePoint() {
		System.out.printf("x :(%d%d)\t", x.x, x.y);
		System.out.printf("x :(%d%d)\t", y.x, y.y);
		System.out.printf("x :(%d%d)\t", z.x, z.y);
	}
}

/////////////////////////////////////////////////////////////////
//�迭 ���� Ʈ���� �ޱ� �̴�.	
//��� �迭
//�� �����ε� �� ���ԵȰ���.
class Triangle2 extends Shape {
	Point[] pointarray;

	// Point x; //int x, int y ������ �ȿ� ��ǥ���� ����ִ�.
//	Point y;
//	Point z;
	Triangle2() { // default �����ڷ� �׸��� �䷸�� ������ �ȴ�.
//		pointarray = new Point[3]; //�游... ����� ä������Ѵ�.
//		pointarray[0] = new Point(10,20);
//		pointarray[1] = new Point(30,40);
//		pointarray[2] = new Point(50,60);
//	�ȵſ�>>	pointarray = {new Point(10,20),new Point(30,40),new Point(50,60)}

		this(new Point[] { new Point(10, 20), new Point(30, 40), new Point(50, 60) });
	}

	Triangle2(Point[] pointarray) {// �Ķ���ͷ� �迭�� �ּҰ��� �޴´�.
		this.pointarray = pointarray; // �̷����ϸ� ����Ʈ �迭�� �ּҰ��� �Ҵ��Ѵ�.
	}

	// ��üȭ, Ư��ȭ �Ȱ� ������
	// �߰����� ���
	void trianglePoint() {
		for (Point point : this.pointarray) {
			System.out.printf("point : (%d,%d)\t", point.x, point.y);
		    System.out.println();
		}
	}
}


//�簢�� ����� ������.

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






public class Ex02_Inherit_Composition { // �����ϰ� ����ϴ� ������ ����.

	public static void main(String[] args) {
		Circle circle = new Circle();
		System.out.println("������: " + circle.r);
		System.out.println("�θ�: " + circle.color);
		System.out.println("��ǥ: " + circle.point.x);
		System.out.println("��ǥ: " + circle.point.y);
		circle.draw();

		Circle circle2 = new Circle(20, new Point(2, 5));
		System.out.println("������: " + circle2.r);
		System.out.println("�θ�: " + circle2.color);
		System.out.println("��ǥ: " + circle2.point.x);
		System.out.println("��ǥ: " + circle2.point.y);
		circle2.draw();

		
		//////////////////////////////////////////////////////
		
		
		Triangle triangle = new Triangle();
		triangle.trianglePoint();
		triangle.draw();

		// �⺻�� �ƴѰ�
		Point[] pointarray = { new Point(11, 21), new Point(31, 41), new Point(51, 61) }; // �̰� ���� ���ϴ� ��� �׸���.
		Triangle2 triangle3 = new Triangle2(pointarray);
		triangle3.trianglePoint();
		
		
		///////////////////////////////////////////////////////
		
		
		Square s = new Square();
		System.out.println();
		s.squarePrint();
		s.draw();
	}

}
