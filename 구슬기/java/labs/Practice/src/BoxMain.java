import java.util.Scanner;

public class BoxMain {

	public static void main(String[] args) {
		
		
	    
	    System.out.println("===Box ���� ���ϱ� ===");
	    System.out.println("ù ��° �ڽ��� ����, ����, ���̸� �Է��ϼ���. (����� ����)");
	    Scanner sc = new Scanner(System.in);
	    	int i = sc.nextInt();
	    	int i2 = sc.nextInt();
	    	int i3 = sc.nextInt();
	    	Box aa = new Box(i,i2,i3);
	    System.out.println("�� ��° �ڽ��� ����, ����, ���̸� �Է��ϼ���. (����� ����)");
	    	int bi = sc.nextInt();
	    	int bi2 = sc.nextInt();
	    	int bi3 = sc.nextInt();
	    	Box bb = new Box(bi,bi2,bi3);
	    	
	    	aa.getVolume();
			bb.getVolume();
			
		    System.out.println(aa.getName(aa,bb));
	}

}
