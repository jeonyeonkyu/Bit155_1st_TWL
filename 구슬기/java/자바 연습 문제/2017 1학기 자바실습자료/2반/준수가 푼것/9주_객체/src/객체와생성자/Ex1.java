package ��ü�ͻ�����;

public class Ex1 {
	public static void main(String[] args){
		ConscriptManager person1 = new ConscriptManager();
		ConscriptManager person2 = new ConscriptManager("���缮");
		ConscriptManager person3 = new ConscriptManager("�ڸ��",46);
		ConscriptManager person4 = new ConscriptManager("������",22,true);
		
		person1.printResult();
		person2.printResult();
		person3.printResult();
		person4.printResult();
		
	}
}


class ConscriptManager{
	private String name = "ȫ�浿";
	private int age = 20;
	private boolean isMarried = false;
	
	ConscriptManager(){
		this("ȫ�浿",20,false);
	}
	ConscriptManager(String nam){
		this(nam,20,false);
	}
	ConscriptManager(String nam,int ag){
		this(nam,ag,false);
	}
	ConscriptManager(String nam,int ag,boolean bool){
		this.name=nam;
		this.age=ag;
		this.isMarried=bool;
	}
	
	void printResult(){
		System.out.println("===¡���˻� ���ǥ===");
		System.out.println("�̸�: "+name);
		System.out.println("����: "+age);
		if(isMarried){
			System.out.println("��ȥ���� : ��ȥ");
		}else{
			System.out.println("��ȥ���� : ��ȥ");
		}
		if(20<=age && age<30 &&!(isMarried)){
			System.out.println("¡���˻� ��� �հ��Դϴ�..");
		}else{
			System.out.println("¡���˻� ��� ���հ��Դϴ�..");
		}
		System.out.println("==============\n");
	}
}