package �������̽�_�߻�Ŭ����_����;
import java.math.*;
import java.util.Scanner;

public class �߻�Ŭ���� {
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		Shape[] infor = new Shape[3];
		boolean flag=true;
		System.out.println("------ �Է� ------");
		for(int i=1;i<=3;i++)
		{
			System.out.println("**" + i + "/3 " + "**");
			System.out.println("���簢�� : [1] [����] [����] ������ �Է�");
			System.out.println(" ��        : [2] [������] ������ �Է�");
			System.out.print("�Է�  : ");
			String str = sc.nextLine();
			String[] strary = str.split(" ");
			if(Integer.parseInt(strary[0])==1){
				infor[i-1]= new Rectangle(Integer.parseInt(strary[1]),Integer.parseInt(strary[2]));
			}else if(Integer.parseInt(strary[0])==2){
				infor[i-1]= new Circle(Integer.parseInt(strary[1]));
			}else{
				System.out.println("�߸� �Է��ϼ̽��ϴ�.");
				flag=false;
				break;
			}
		}
		System.out.println("------ ��� ------");
		for(int i=1;i<=3;i++){
			System.out.println("**" + i + "/3 " + "**");
			System.out.println("�ѷ� : " + infor[i-1].getEdgeSize());
			System.out.println("�ѷ� : " + infor[i-1].getAreaSize());
		}
	}
}




abstract class Shape{
	
	abstract double getEdgeSize(); //�ѷ��� ����Ͽ� ��ȯ
	abstract double getAreaSize(); //������ ����Ͽ� ��ȯ
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