class Human{
	String name;
}

class OverTest{
	int add(int i, int j) {
		return i+j;
	}
	void add(Human human) {
		System.out.println(human.name);
	}
	int add(int param) {
		return param;
	}
	//�迭�� Ÿ���̴�!
	int[] add(int[] param) {  //int[]���ٰ� return �Ѵ�.
		int[] target = new int[param.length];  //Ÿ���� ���ÿ� �־ �Լ��� ������� ����������, ���� ���� 11,21,31,41,51 �� �����Ǽ� 31������ �ּҸ� �Ѱ��ش�.
		for(int i =0;i<param.length;i++) {
			target[i] = param[i]+1;  //target �� 0���濡�� 11, 1���濡�� 21 ...�̷��� ����.
		}
		return target; //�迭�� ��ü ,��ü�� �⺻���� ��
	}
	
//	int[] add(int[] so, int[] so2) {
//		int[] g = new int[so.length];
//		int[] h = new int[so2.length];
//		
//		int[] gh = new int[1];
//		gh[0]= g[0] + h[0];
//	
//		return gh;  //��ȯ�� �迭�� �ּҰ��� �����
//	}
	int[] add(int[] so, int[] so2) {
		int length = (so.length > so2.length)? so.length : so2.length;
		int[] resultarray = new int[length];
		
		for(int i=0; i< resultarray.length;i++) {
			resultarray[i] = so[i] + so2[i];
		}
		return resultarray;
	}
}


public class Ex09_Array_Parameter {

	public static void main(String[] args) {
		OverTest ot = new OverTest();    
		int[] soruce = {10,20,30,40,50};
		int [] target = ot.add(soruce); // target �迭�� ���� ���� 11,21,31,41,51�� ���� ���� �ּҸ� ������ �ȴ�.
		for(int ta : target) {
			System.out.println(ta);
		}
//		int[] s= {1,2,3};
//		int[] g = {4,5,6};
//		int[] ss = ot.add(s,g );
	
		

	}

}
