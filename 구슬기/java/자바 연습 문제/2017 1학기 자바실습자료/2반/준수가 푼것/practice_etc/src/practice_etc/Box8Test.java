package practice_etc;



class Box8{
	private int width;
	private int height;
	private int depth;
	private int vol;
	
	public Box8(int w, int h, int d){
		width = w;
		height = h;
		depth = d;
		volume();
	}
	private void volume(){
		vol = width * height * depth;
	}
	public int getvolume(){
		return vol;
	}
}

public class Box8Test {

	public static void main(String[] args) {
		// 227p 자바 코드의 정석
		
		Box8 mybox1 = new Box8(10,20,30);
		// mybox1.width = 20 ; private로 선언된 변수에 접근하면 오류 발생
		// int vol1 = mybox1.volume(); private로 선언된 메소드에 접근하면 오류 발생
		System.out.println("정수 박스의 부피 : " + mybox1.getvolume());
		
		
	}

}
