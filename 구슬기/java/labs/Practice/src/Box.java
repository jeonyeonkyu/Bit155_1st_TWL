
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
	
	public String getName(Box a , Box b) {
		String g="Box ["+b.height+"*"+b.vertical+"*"+b.width+"] 는 Box [" +a.height +"*"+a.vertical+"*"+a.width+"]보다 부피가 작다";
		String gg="Box ["+b.height+"*"+b.vertical+"*"+b.width+"] 는 Box [" +a.height +"*"+a.vertical+"*"+a.width+"]보다 부피가 크다";

		String bee = (a.volume > b.volume) ? g : gg;
		
		return bee;
	}

}
