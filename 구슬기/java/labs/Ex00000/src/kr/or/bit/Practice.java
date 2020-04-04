package kr.or.bit;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

class EmpData{
	 String name;
	 int[] numbers;
	 ArrayList elist;
	
	EmpData(){
		this.name = "�ƹ���";
		this.numbers = new int[10];
		elist = new ArrayList();
	}
	
}

class Gen<T>{ //Type parameter
	T obj;
	
	void add(T obj) {
		this.obj = obj;
	}
	T get() {
		return this.obj;
	}
}

public class Practice {

	public static void main(String[] args) {
		ArrayList arraylist = new ArrayList();
		
		arraylist.add(100);
		arraylist.add(300);
		arraylist.add(393);
		
		//���빰 �̴� ��� 4����
		//[100, 300, 393]
		
		for(int k = 0;k<arraylist.size();k++) {
			System.out.println(arraylist.get(k));
		}
		
		for(Object j : arraylist) {
			System.out.println(j);
		}
		System.out.println(arraylist.toString());
		System.out.println(arraylist);
		
		//Ư������ ���� ���� ������
		System.out.println(arraylist.get(0));  
		
		//add ���������ε����� �ֱ�
		arraylist.add(1,50);
		System.out.println(arraylist); //[100, 50, 300, 393]
		
		System.out.println(arraylist.contains(50));  //true
		
		System.out.println(arraylist.isEmpty()); //false
		
		System.out.println(arraylist);  //[100, 50, 300, 393]
		System.out.println(arraylist.size()); //4
		
		arraylist.clear();
		
		System.out.println(arraylist); //  []
		System.out.println(arraylist.size());// 0
		System.out.println(arraylist.isEmpty()); //true
		
		arraylist.add(300);
		arraylist.add(200);
		arraylist.add(100);
		
		System.out.println(arraylist.toString());
		System.out.println("������ ������: "+arraylist.remove(0));
		System.out.println(arraylist);
		
		arraylist.add(90);
		arraylist.add(80);
		arraylist.add(70);
		
		System.out.println(arraylist); //[200, 100, 90, 80, 70]
		//arraylist.add(4, 20000);
		arraylist.set(0, 20000);
		
		//add �� �߰� �ϴ°Ű�, set �� �ٲ�ġ��
		System.out.println(arraylist);
		
		System.out.println("************************");
		
		List li = new ArrayList();
		li.add(new Bird());
		li.add(new Bird());
		System.out.println(li);
		
		for(int i = 0;i<li.size();i++) {
			Bird e = (Bird) li.get(i); //(Object ���� Bird �� �ٿ� ĳ����)
			System.out.println(e.g);
			//Bird�� �ٿ� ĳ���� �ؾ��� ��ü���� ����ʵ忡 ���� �� �� �ִ�.
		}
		li.add(new EmpData());
		System.out.println(li);
		EmpData e = (EmpData)li.get(2);
	    
		ArrayList<EmpData> empdata = new ArrayList<EmpData>();
		empdata.add(new EmpData());
		empdata.add(new EmpData());
		for(EmpData p : empdata) {
			System.out.println(p);
		}
		EmpData d = empdata.get(0);
		System.out.println(d.name);
		d.name = "KuAmu";
		System.out.println(d.name);
		
		Gen<EmpData> gen = new Gen<EmpData>();
		gen.add(new EmpData());
		EmpData dd = gen.get();
		System.out.println(dd.elist);
		
		
		ArrayList list = new ArrayList();
		list.add(100);
		list.add(200);
		list.add(300);
		
		//���� ����� 1��
		for(int i = 0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		
		//Iterator Ȱ���ϱ� 
		Iterator it = list.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
		
		ArrayList<Integer> inte = new ArrayList<Integer>();
		inte.add(50000);
		inte.add(5000);
		inte.add(500);
		inte.add(50);
		inte.add(5);
		
		Iterator<Integer> it2 = inte.iterator();
		while(it2.hasNext()) {
			System.out.println(it2.next());
		}
		
		for(int i=inte.size()-1; i>=0;i--) {
			System.out.println(inte.get(i));
		}
		
		
		
		ListIterator<Integer> li2 = (ListIterator<Integer>) inte.iterator();
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
