package Proxy_Pattern.Ex1;

public class RealImage implements Image {
	private String fileName;

	public RealImage(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public void draw() {
		System.out.println("Displaying : " + fileName);
	}

	public void diskImage() {
		System.out.println("�̹��� ĳ�� : " + fileName);
	}

}