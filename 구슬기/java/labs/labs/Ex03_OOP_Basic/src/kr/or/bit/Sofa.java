package kr.or.bit;

public class Sofa {
	int h; 
	String color;
	String leg;
	String leather;
	int stool;
	public Sofa(){}
	
	Sofa(String color){
		
		this.color = color;
		
	}
	Sofa(String color, String leg){
		this.color = color;
		this.leg = leg;
		
	}
	Sofa(String color, String leg, String leather){
		this.color = color;
		this.leg = leg;
		this.leather = leather;
		
	}
	Sofa(String color, String leg, String leather, int stool){
		this.color = color;
		this.leg = leg;
		this.leather = leather;
		this.stool = stool;
	}
	
	void print() {
		System.out.println(this.color + "/"+ this.leg + "/" + this.leather + "/"+ this.stool);
	}
	

}
