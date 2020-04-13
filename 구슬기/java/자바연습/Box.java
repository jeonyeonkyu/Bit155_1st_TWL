package practice;

public class Box {
	int width; //가로
	int vertical;  //세로
	int height;    //높이
	int volume;    //부피
	
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
