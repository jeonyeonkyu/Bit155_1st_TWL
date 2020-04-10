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
	//배열도 타입이다!
	int[] add(int[] param) {  //int[]에다가 return 한다.
		int[] target = new int[param.length];  //타겟은 스택에 있어서 함수가 사라지면 없어지지만, 힙에 생긴 11,21,31,41,51 은 유지되서 31번에서 주소를 넘겨준다.
		for(int i =0;i<param.length;i++) {
			target[i] = param[i]+1;  //target 의 0번방에는 11, 1번방에는 21 ...이렇게 들어간다.
		}
		return target; //배열은 객체 ,객체의 기본값은 널
	}
	
//	int[] add(int[] so, int[] so2) {
//		int[] g = new int[so.length];
//		int[] h = new int[so2.length];
//		
//		int[] gh = new int[1];
//		gh[0]= g[0] + h[0];
//	
//		return gh;  //반환은 배열의 주소값이 어야함
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
		int [] target = ot.add(soruce); // target 배열은 힙에 생긴 11,21,31,41,51의 값을 가진 주소를 가지게 된다.
		for(int ta : target) {
			System.out.println(ta);
		}
//		int[] s= {1,2,3};
//		int[] g = {4,5,6};
//		int[] ss = ot.add(s,g );
	
		

	}

}
