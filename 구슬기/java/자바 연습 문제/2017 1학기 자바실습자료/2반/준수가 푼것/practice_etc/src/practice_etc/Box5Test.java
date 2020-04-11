package practice_etc;

class Box5{
	int width;
	int height;
	int depth;
	public Box5(int w, int h, int d){
		width = w;
		height = h;
		depth = d;
	}
}

public class Box5Test {

	public static void main(String[] args) {
		
		// 214p
		
		
		Box5 mybox1 = new Box5(10,20,30);
		int vol = mybox1.width * mybox1.height * mybox1.depth ;
		System.out.println("박스의 부피 : " + vol );
	}

}
