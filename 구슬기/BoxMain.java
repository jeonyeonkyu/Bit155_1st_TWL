import java.util.Scanner;

public class BoxMain {

	public static void main(String[] args) {
		
		
	    
	    System.out.println("===Box 부피 비교하기 ===");
	    System.out.println("첫 번째 박스의 가로, 세로, 높이를 입력하세요. (띄어쓰기로 구분)");
	    Scanner sc = new Scanner(System.in);
	    	int i = sc.nextInt();
	    	int i2 = sc.nextInt();
	    	int i3 = sc.nextInt();
	    	Box aa = new Box(i,i2,i3);
	    System.out.println("두 번째 박스의 가로, 세로, 높이를 입력하세요. (띄어쓰기로 구분)");
	    	int bi = sc.nextInt();
	    	int bi2 = sc.nextInt();
	    	int bi3 = sc.nextInt();
	    	Box bb = new Box(bi,bi2,bi3);
	    	
	    	aa.getVolume();
			bb.getVolume();
			
		    System.out.println(aa.getName(aa,bb));
	}

}
