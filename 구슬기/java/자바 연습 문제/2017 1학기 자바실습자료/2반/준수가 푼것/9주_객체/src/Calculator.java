
public class Calculator {
	int iNum1, iNum2;

	void sum (String a){
		System.out.println("1.Stirng�� �Ű�����");
		
		String[] cut = a.split(",");
		iNum1 = Integer.parseInt(cut[0]);
		iNum2 = Integer.parseInt(cut[1]); 
		int c = iNum1 + iNum2;
	System.out.println("sum('8,14'):"+ c);
	}
	void sum (int a, int b){
		iNum1 = a;
		iNum2 = b;
		int c = a + b;
		System.out.println("1.int�� �Ű�����");
		System.out.println("sum(8,14):"+ c);
	}
	void sum (int a, String b){
		iNum1 = a;
		iNum2 = Integer.parseInt(b);
		int c = a + iNum2;
		System.out.println("1.Stirng�� �Ű�����");
		System.out.println("sum(8,'14'):"+c);
	}
	void sum (String a, int b){
		iNum2 = b;
		iNum1 = Integer.parseInt(a);
		int c = b + iNum1;
		System.out.println("1.Stirng�� �Ű�����");
		System.out.println("sum('8',14):"+c);
	}
	void sum (String a, String b){
		iNum1 = Integer.parseInt(a);
		iNum2 = Integer.parseInt(b);
		int c = iNum1 + iNum2;
		System.out.println("1.Stirng�� �Ű�����");
		System.out.println("sum('8','14'):"+c);
	}

}
