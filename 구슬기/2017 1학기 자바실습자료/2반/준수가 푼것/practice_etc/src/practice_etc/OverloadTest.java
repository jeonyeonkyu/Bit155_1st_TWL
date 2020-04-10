package practice_etc;

class Overload{
	void calc(){
		System.out.println("매개변수가 없습니다.");
	}
	void calc(int width){
		System.out.println("정사각형의 넓이 " + width*width);
	}
	void calc(int width,int height){
		System.out.println("직사각형의 넓이 " + width*height);
	}
	void calc(int width,int height, int depth){
		System.out.println("직육면체의 넓이 " + width*height*depth);
	}
}

public class OverloadTest {

	public static void main(String[] args) {
		
		
		// 235p
		
		
		Overload o1 = new Overload();
		int input[] = new int[args.length];
		for(int i=0; i<args.length; i++){
			input[i] = Integer.parseInt(args[i]);
		}
		switch(args.length){
			case 0:
				o1.calc();
				break;
			case 1:
				o1.calc(input[0]);
				break;
			case 2:
				o1.calc(input[0], input[1]);
				break;
			case 3:
				o1.calc(input[0],input[1], input[2]);
				break;
			default:
				System.out.println("인수의 개수가 많습니다.");
		}
		

	}

}
