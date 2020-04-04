package kr.or.bit;

public class NoteBook {
	public String color; //밖에 볼수있고
	private int year; //밖에서 볼수없음
	// 직접 할당을 막고 간접할당을 통해서 자료를 보호하겠다. 
	//프라이빗을 하는이유. 직접할당? 바로 보는것 
	//이게 간접할당 그리고 캡슐화(내가 당신한테 직접주는 걸 막고 간접적으로 내가 원하는 답만 받을수 있도록 하는것)
	
	
	public void setYear(int y) { //year write 담당하는.... 캡슐화된 것에서 쓰기담당   setter함수
		if(y< 0) {
			year = 1999;
		}else {
			year = y;
		}
		
		
	}
	public int getYear() { //겟 함수  읽기담당 getter함수 ex)ooo님 하고 싶으면 get 함수에 name + "님"; 해야함.
		return year;
	}
	public Mouse handle(Mouse m) { //마우스라는 타입을 파라메터로 받음. Point m >> 주소값 
		m.x =100;
		m.y = 200;
		return m;
	}
	
}
