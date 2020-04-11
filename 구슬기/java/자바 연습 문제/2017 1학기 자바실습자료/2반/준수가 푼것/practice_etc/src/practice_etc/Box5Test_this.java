package practice_etc;

class Box6{
	int width;
	int height;
	int depth;
	
	
	public Box6(){
		this(1,1,1);
	}
	public Box6(int w){
		this(w,1,1);
	}
	public Box6(int w, int h){
		this(w,h,1);
	}
	
	
	
	public Box6(int w, int h, int d){
		width = w;
		height = h;
		depth = d;
	}
}

public class Box5Test_this {

	public static void main(String[] args) {
		
		// 221p
		
		
		Box6 mybox1 = new Box6();
		Box6 mybox2 = new Box6(10);
		Box6 mybox3 = new Box6(10,20);
		Box6 mybox4 = new Box6(10,20,30);
		int vol1 = mybox1.width * mybox1.height * mybox1.depth ;
		int vol2 = mybox2.width * mybox2.height * mybox2.depth ;
		int vol3 = mybox3.width * mybox3.height * mybox3.depth ;
		int vol4 = mybox4.width * mybox4.height * mybox4.depth ;

		System.out.println("박스의 부피 1 : " + vol1 );
		System.out.println("박스의 부피 2 : " + vol2 );
		System.out.println("박스의 부피 3 : " + vol3 );
		System.out.println("박스의 부피 4 : " + vol4 );
	}

}
