package kr.or.bit;




public class Car {
	private int window; //�ڵ����� â���� �����ִ�.
	private int speed; //�ڵ����� �ӵ��� �����ִ�.
	public int getWindow() {
		return window;
	}
	public void setWindow(int window) {
		this.window = window; //�𽺴� �ĸ����ͷ� �ִ°Ŷ� ����ʵ�� �浹�ؼ��׷�
	}
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		//�����Ҵ�
		if(speed <0) {
			this.speed = 0;
		}else {
			this.speed = speed;
		}
		this.speed = speed;
	}
	
	//�ӵ��� 10�� �ø��ų� �����ϴ� ����� ���弼��
	public void speedUp() {
		speed+=10;
	}
	
	public void speedDown() {
		if(speed > 0) {
			speed-=10;
		}else {
			speed=0;
		}
	}
	
		
		
		
		
		/*
	}
	public void writeSpeed(int sp) {
		speed = sp;
	}
	public int readSpeed() {
		return speed;
	}
	*/

}
