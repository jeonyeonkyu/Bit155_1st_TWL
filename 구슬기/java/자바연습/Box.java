package practice;

public class Box {
	int width; //����
	int vertical;  //����
	int height;    //����
	int volume;    //����
	
	public Box(int width,int vertical, int height) {
		this.width = width;
		this.vertical = vertical;
		this.height = height;
		
		volume = width * vertical * height;
	}
	public int getVolume() {
		return volume;
	}
	
	public String getName() {
		String a = "Box [00 * 00 * 00]";
		return a;
	}

}
