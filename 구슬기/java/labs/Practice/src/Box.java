
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
	
	public String getName(Box a , Box b) {
		String g="Box ["+b.height+"*"+b.vertical+"*"+b.width+"] �� Box [" +a.height +"*"+a.vertical+"*"+a.width+"]���� ���ǰ� �۴�";
		String gg="Box ["+b.height+"*"+b.vertical+"*"+b.width+"] �� Box [" +a.height +"*"+a.vertical+"*"+a.width+"]���� ���ǰ� ũ��";

		String bee = (a.volume > b.volume) ? g : gg;
		
		return bee;
	}

}
