package kr.or.bit.common;

//Car 클래스, Person 클래스 Bitmain 은 같은 폴더(Package)안에 있습니다.

public class Bitmain {
	public static void main(String[] args) {
		Car c = new Car();
		Person p = new Person();
		
		c.door =200;  //얘는 같은 패키지(폴더)라서 접근가능  
		              // 디폴트는 같은 폴더내에서만 접근 가능
                      //실무에서는 거의 디폴트 안씀. 디폴트는 거의 연습할때만 씀
		              //실무는  공유할거임 public 감출거임 private 씀
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
