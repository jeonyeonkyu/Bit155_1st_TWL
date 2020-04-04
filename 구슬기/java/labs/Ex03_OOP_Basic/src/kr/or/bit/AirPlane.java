package kr.or.bit;
/*
 우리 회사는 비행기를 주문 제작 판매하는 회사입니다
 우리회사는 비행기를 생산하는 설계도를 작성하려고 합니다
 
 요구사항
 1. 비행기를 생산하고 비행기의 이름과 번호를 부여해야 합니다.
 2. 비행기가 생산되면 비행기의 이름과 번호 맞게 부여되었는지를 확인 하는 작업이 필요합니다. (출력정보 확인)
 3.공장장은 현재까지 만들어진 비행기의 총대수(누적)을 확인 할 수 있습니다.
 
 
AirPlane air = new AirPlane();
AirPlane air2 = new AirPlane();
AirPlane air3 = new AirPlane();

정확하게 하면 아래 코드는 50점 >> 생성자..쓰지 않았다.
그런데 지금까지 배운 코드로 보면 99점>> 함수 기반

2~3 일 뒤에 아래코드를 백점 짜리로 바꿀 예정

내가 만든거는 total 값을 구하지 못했음 가능하면 다시 해보셈

틀릴수 있는 위험이 있는 코드를 짜는건 좋지 않은 코드다.

 
public class AirPlane {
	private int airnum;
	private String airname;
	private static int total; //누적
	
	
	public void makeAirPlane(int num, String name) {
		airnum = num;
		airname = name;
		//강제
		total ++;
	 System.out.printf("번호:[%d], 이름:[%s]\n",airnum,airname);
	}
	
	public void airPlaneTotalcount() {
		System.out.printf("총 비행기 제작 대 수:[%d]\n",total);
	}
*/
//이거에 들어간 것들.
//캡슐화
//스테틱
//모든객체가 공유하는 자원 스테틱
//오버로딩을 컨스트럭터를 통해 초기화 강제
//디스 를 써서 가독성을 높여준다.
//method
//printf    


//이건 생성자 함수로 만든것.
//90점  >>  this 쓰지 않아서....
//this 적용해서 100점

public class AirPlane {
	private int airnum;
	private String airname;
	private static int total;
	
	public AirPlane(int airnum, String airname){ //당신이 비행기를 만들려면 당신은 반드시 번호, 이름을 넣어야 합니다.
		this.airname = airname;
		this.airnum = airnum;
		total ++;
		System.out.printf("번호:[%d], 이름:[%s]\n",airnum,airname);
	}

	
	public void airPlaneTotalcount() {
		System.out.printf("총 비행기 제작 대 수:[%d]\n",total);
	
	
	}
}
