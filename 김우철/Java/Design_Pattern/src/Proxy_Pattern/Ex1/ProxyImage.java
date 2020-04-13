package Proxy_Pattern.Ex1;

public class ProxyImage implements Image{
	private RealImage realImage;
	private String fileName;
	
	public ProxyImage(String fileName) {
		this.fileName = fileName;
	}
	
	@Override
	public void draw() {
		if(realImage == null) {
			realImage = new RealImage(fileName);
			realImage.draw();
		}
		else realImage.diskImage();
	}

}
