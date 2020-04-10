class Data{
	 int i;
}


public class Ex13_Method_Call {
	

	public static void main(String[] args) {
		Data d = new Data();
		d.i = 100;
		System.out.println("d.i : "+ d.i);

		scall(d); //주소값 할당 주소값은 값이 바뀌면 값이 바뀐다.
		
		System.out.println("d.i : "+ d.i); //111
		
		vcall(d.i); //d.i>>111      값은 안바뀜.  ex) 111,8888
		System.out.println("d.i : "+ d.i);
	}
	
	
	static void scall(Data data) { //함수의 파라메터로 클래스 타입이 올수있다. 그옆에는 동일한 타입주소가 들어와야한다.
		                           // Data 라는 타입을 갖는 주소값을 받는다
		                           //data 변수 >> xx 번지
		System.out.println("함수: "+ data.i); //100 이 나온다
		data.i = 111;
	}
	
	static void vcall(int x) { //얘는 값을 받는다.
		System.out.println("before : "+x);
		x = 8888;
		System.out.println("before : "+x);
	}

}
