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
		// 227p �ڹ� �ڵ��� ����
		
		Box8 mybox1 = new Box8(10,20,30);
		// mybox1.width = 20 ; private�� ����� ������ �����ϸ� ���� �߻�
		// int vol1 = mybox1.volume(); private�� ����� �޼ҵ忡 �����ϸ� ���� �߻�
		System.out.println("���� �ڽ��� ���� : " + mybox1.getvolume());
		
		
	}

}
