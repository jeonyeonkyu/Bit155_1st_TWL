//두개의 설계도
class Tv {
	boolean power;
	int ch;

	void power() {
		this.power = !this.power; // 꺼지지 않으면 켜지는거. 펄스면 트루, 트루면 펄스값을 준다.
	}

	void chUp() {
		this.ch++;
	}

	void chDown() {
		this.ch--;
	}
}

class Vcr { // 비디오 플레이어
	boolean power;

	void power() {
		this.power = !this.power;
	}

	void play() {
		System.out.println("재생하기");
	}

	void stop() {
		System.out.println("정지하기");
	}

	void rew() {
	}

	void ff() {
	}
}

//Tv 설계도, Vcr 설계도
//TvVcr 라는 설계도만들어 주세요..   티비랑 비디오 플레이어랑 붙어있는것.
//기존의 Tv, Vcr 설계도 잘 이용해봐
//상속, 포함 여태까지 배운건
//class TvVcr extends Tv, Vcr 다중상속금지(x)
//class Tv extends Vcr
//class TvVcr extens Tv  계층적 상속... 문제는 중복기능(같은이름의 기능)으로 인해 충돌이 생김.  (x)

//질문 
//TvVcr 설계도 새롭게... Tv설계또, Vcr 설계도 활용
//답 : TvVcr 주기능 은 뭘까? Tv 를 많이 본다.   메인기능 >> 비중이 높은 클래스를 상속 받는다. 
// 그리고 나머지는 포함으로 한다.
//TvVcr 안에 Tv, Vcr 을 포함해도 된다. 판단은 개인이 한다.
//프로젝트하면서 설계도 만들면 타협점을 찾는게 중요하다.

class TvVcr extends Tv{  //Tv 라는 기능을 더 사용하니까 상속           (상속) TvVcr is a Tv .....(포함)TvVcr has a Vcr....
	Vcr vcr;
	TvVcr(){
		vcr = new Vcr();  // 힙에 올라간다. 객체 세개 생성됨    Tv,TvVcr,Vcr 세개 
	}
}

public class Ex03_Inherit_Single {

	public static void main(String[] args) {
		TvVcr t =  new TvVcr();
		t.power(); //tv의 파워이다.                      ////////오잉??? 한번더 봐라.이해안되면 외워.
		System.out.println("Tv전원상태 : "+ t.power);
		t.chUp();
		System.out.println("Tv채널상태 : "+ t.ch);
		
		System.out.println("-----------------------");
		//비디오켠거.
		t.vcr.power(); //video의 파워이다.
		System.out.println("비디오 전원상태 : "+ t.vcr.power);
		t.vcr.play();
		t.vcr.stop();
		
		t.vcr.power();
		t.power();
		System.out.println("Tv전원상태 : "+ t.power);
		System.out.println("비디오 전원상태 : "+ t.vcr.power);
		
		
	}

}
