
public class Coffee {
	boolean isIce;
	String strMilk;
	
	
	public Coffee(){
		isIce =false;
		strMilk = "";
	}
	
	public Coffee(boolean a){
		isIce = a;
		a = true;
		

	}
	public Coffee(String a, boolean b){
		strMilk = a;
		isIce = b;
		b = false;
	}
		
	void make(){
		System.out.println("�Ƹ޸�ī�� hot�Դϴ�.");
	}
	
	void make(boolean a){
		
			System.out.println("�Ƹ޸�ī�� ice�Դϴ�.");
	}
	
	void make(String a){
		
			System.out.println("������ ���� ī��� hot�Դϴ�.");
	}
	
	void make(String a, boolean b){
		if(a == "����")
			{System.out.print("������ ���� ");}
		else if(a == "����")
			{System.out.print("������ ����");}
		
		if(b == true)
			{System.out.println("ī��� ice�Դϴ�.");}
		else
			{System.out.println("ī��� hot�Դϴ�.");}
	}
	
	
}
