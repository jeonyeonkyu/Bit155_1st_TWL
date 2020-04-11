package 인터페이스_추상클래스_스택;
import java.math.*;
import java.util.Scanner;

public class 추상클래스 {
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		Shape[] infor = new Shape[3];
		boolean flag=true;
		System.out.println("------ 입력 ------");
		for(int i=1;i<=3;i++)
		{
			System.out.println("**" + i + "/3 " + "**");
			System.out.println("직사각형 : [1] [가로] [세로] 순으로 입력");
			System.out.println(" 원        : [2] [반지름] 순으로 입력");
			System.out.print("입력  : ");
			String str = sc.nextLine();
			String[] strary = str.split(" ");
			if(Integer.parseInt(strary[0])==1){
				infor[i-1]= new Rectangle(Integer.parseInt(strary[1]),Integer.parseInt(strary[2]));
			}else if(Integer.parseInt(strary[0])==2){
				infor[i-1]= new Circle(Integer.parseInt(strary[1]));
			}else{
				System.out.println("잘못 입력하셨습니다.");
				flag=false;
				break;
			}
		}
		System.out.println("------ 출력 ------");
		for(int i=1;i<=3;i++){
			System.out.println("**" + i + "/3 " + "**");
			System.out.println("둘레 : " + infor[i-1].getEdgeSize());
			System.out.println("둘레 : " + infor[i-1].getAreaSize());
		}
	}
}




abstract class Shape{
	
	abstract double getEdgeSize(); //둘레를 계산하여 반환
	abstract double getAreaSize(); //면적을 계산하여 반환
}

class Circle extends Shape{
	int r;
	public Circle(int r){
		this.r=r;
	}
	double getEdgeSize(){
		return 2*r*Math.PI;
	}
	double getAreaSize(){
		return r*r*Math.PI;
	}
}
class Rectangle extends Shape{
	int width;
	int height;
	public Rectangle(int width, int height){
		this.width=width;
		this.height=height;
	}
	double getEdgeSize(){
		return (2*width+2*height);
	}
	double getAreaSize(){
		return (width*height);
	}
}