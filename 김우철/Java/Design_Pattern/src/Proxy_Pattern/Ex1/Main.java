//https://blog.naver.com/2feelus/220655183083
//+https://meylady.tistory.com/58

package Proxy_Pattern.Ex1;

public class Main {
	public static void main(String[] args) {
		Image image = new ProxyImage("111.jpg");
		Image image2 = new ProxyImage("222.jpg");
		//객체 1번 생성
		image.draw();		
		//기존에 생성한 객체 이용
		image.draw();
		image.draw();
		
		image2.draw();
		image2.draw();
		image2.draw();
	}

}