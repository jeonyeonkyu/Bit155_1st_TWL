/*
시나리오(요구사항)
저희는 가전제품 매장 솔루션을 개발하는 사업팀입니다
A라는 전자제품 매장이 오픈되면 
[클라이언트 요구사항]
가전제품은  제품의 가격 , 제품의 포인트 정보를 공통적으로 가지고 있습니다
각각의 가전제품은 제품별 고유한 이름을 가지고 있다
ex)
각각의 전자제품은 이름을 가지고 있다(ex: Tv , Audio , Computer)
각각의 전자제품은 다른 가격을 가지고 있다(Tv:5000, Audio:6000 ....)
제품의 포인트는 가격의 10% 적용한다
 
시뮬레이션 시나리오
구매자 : 제품을 구매하기 위한 금액정보 , 포인트 정보를 가지고 있다 
예를 들면 : 10만원  , 포인트 0
구매자는 제품을 구매할 수 있다 , 구매행위를 하게되면 가지고 있는 돈은  감소하고 포인트는 올라간다
구매자는 처음 초기 금액을 가질 수 있다
*/
//1차 오픈 테스트 성공 가정..
	//하와이 휴가 ... 놀러갔따...
	
	//공식오픈
	//매장에 제품이 1000개의 다른 제품이 들어왔다.(제품 등록 : POS등록 자동화)
	//1000개의 다른 제품이 배치되어있다.
	//1. 매장에서 나머지 997개의 제품을 판매 할 수 있을까요
	//   나머지 997개의 제품을 구매 할 수 있는 기능을 만들지 않았어요.
	//2. 난리가 났다~ >> 인터넷되는곳 찾기 시작 >> 개발서버에접속 >> 휴가 기간동안 997개의 함수를 만들어주게됨.
	//   다 만들고 나면 휴가가 끝..
	//변화에 대응하지 못한것.. 그래서 휴가기간 내내 일을 한것이다.
	
//변화에 대응 할 수 있는 코드를 짜야한다.

	//아래코드를 즐거운 휴가를 보낼 수 있게 방법을제시하세요.

class Buyer {
	int money = 1000;
	int bonuspoint;
	/*

	// 구매행위 (기능)
	// 구매행위 (잔액 -제품의 가격, 포인트 정보 갱신)
	// **구매자는 매장에 있는 모든 물건을 구매 할 수 있다.
	
	
	// 물건이 3개...구매할 수 있는 기능3개
	void kttvBuy(KtTv n) {// 함수가 제품 객체를 parameter로 받아서 (가격, 포인트 정보를 받음)
		if (this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^ " + this.money);
			return; // 함수종료 > kttvBuy 탈출 (구매행위 종료)
		}
		// 실 구매 행위
		this.money -= n.price; // 잔액
		this.bonuspoint += n.bonuspoint; // 누적
		System.out.println("구매한 물건은 : " + n.toString());
	}

	void audioBuy(Audio n) {// 함수가 제품 객체를 parameter로 받아서 (가격, 포인트 정보를 받음)
		if (this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^ " + this.money);
			return; // 함수종료 > kttvBuy 탈출 (구매행위 종료)
		}
		// 실 구매 행위
		this.money -= n.price; // 잔액
		this.bonuspoint += n.bonuspoint; // 누적
		System.out.println("구매한 물건은 : " + n.toString());
	}

	void notebookBuy(NoteBook n) {// 함수가 제품 객체를 parameter로 받아서 (가격, 포인트 정보를 받음)
		if (this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^ " + this.money);
			return; // 함수종료 > kttvBuy 탈출 (구매행위 종료)
		}
		// 실 구매 행위
		this.money -= n.price; // 잔액
		this.bonuspoint += n.bonuspoint; // 누적
		System.out.println("구매한 물건은 : " + n.toString());
	}
	*/
	//2차 코드 개선 (리펙토링)
	//[하나의 이름]으로 여러가지 기능(method overloading)
//	void Buy(KtTv n) {// 함수가 제품 객체를 parameter로 받아서 (가격, 포인트 정보를 받음)
//		if (this.money < n.price) {
//			System.out.println("고객님 잔액이 부족합니다^^ " + this.money);
//			return; // 함수종료 > kttvBuy 탈출 (구매행위 종료)
//		}
//		// 실 구매 행위
//		this.money -= n.price; // 잔액
//		this.bonuspoint += n.bonuspoint; // 누적
//		System.out.println("구매한 물건은 : " + n.toString());
//	}
//
//	void Buy(Audio n) {// 함수가 제품 객체를 parameter로 받아서 (가격, 포인트 정보를 받음)
//		if (this.money < n.price) {
//			System.out.println("고객님 잔액이 부족합니다^^ " + this.money);
//			return; // 함수종료 > kttvBuy 탈출 (구매행위 종료)
//		}
//		// 실 구매 행위
//		this.money -= n.price; // 잔액
//		this.bonuspoint += n.bonuspoint; // 누적
//		System.out.println("구매한 물건은 : " + n.toString());
//	}
//
//	void Buy(NoteBook n) {// 함수가 제품 객체를 parameter로 받아서 (가격, 포인트 정보를 받음)
//		if (this.money < n.price) {
//			System.out.println("고객님 잔액이 부족합니다^^ " + this.money);
//			return; // 함수종료 > kttvBuy 탈출 (구매행위 종료)
//		}
//		// 실 구매 행위
//		this.money -= n.price; // 잔액
//		this.bonuspoint += n.bonuspoint; // 누적
//		System.out.println("구매한 물건은 : " + n.toString());
//	}
	//3차 개선코드 (중복 코드 제거) >>
	//제품이 추가 되더라도 구매행위는 계속 되어야 한다.
	//왜? 즐거운 휴가를 보내기 위해서.
	//힌트 하나의 이름으로 반복코드를 제거하고 
	
	//모든 제품은 product를 상속하고 있다.
	//모든 제품의 부모는 product다.
	//Product p;
	//Audio audio = new Audio();
	//p = audio 주소를 받을수있다.
	//NoteBook notebook = new NoteBook
	//p= notebook point
	//단 부모것만 접근이 가능하다.
	//***toString() 자식이 재정의....부모 타입으로 접근 하더라도  재정의로 넘어간다.
	//
	
	//이거 하나가 다형성이다..
	void Buy(Product n) {// 함수가 제품 객체를 parameter로 받아서 (가격, 포인트 정보를 받음)
		//Product 로 받는 자식타입의 주소는 다 받는게 아니라 주소를 받을때마다 생기고, 다른거 받으면 과거주소는 사라진다. 
		if (this.money < n.price) {
			System.out.println("고객님 잔액이 부족합니다^^ " + this.money);
			return; // 함수종료 > kttvBuy 탈출 (구매행위 종료)
		}
		// 실 구매 행위
		this.money -= n.price; // 잔액
		this.bonuspoint += n.bonuspoint; // 누적
		System.out.println("구매한 물건은 : " + n.toString());
		System.out.println("잔액 : "+ this.money);
		System.out.println("포인트 : "+ this.bonuspoint);
	}

}

class Product {
	int price;
	int bonuspoint;

	// Product() {
	// }
	Product(int price) {
		this.price = price;
		this.bonuspoint = (int) (this.price / 10.0);
	}
}

class KtTv extends Product { // KtTv kttv = new KtTv() >> 가격을 강제로 입력
	KtTv() {
		super(500); // super 타고 Product 안에 가서 파라메터1개있는거 찾아간담에 실행한다.
	}

	@Override
	public String toString() {
		return "KtTv"; // 문자열로 반환되게 해놓음!
	}

}

class Audio extends Product { // Audio audio = new Audio() >> 가격을 강제로 입력
	Audio() {
		super(100);
	}

	@Override
	public String toString() {
		return "Audio";
	}
}

class NoteBook extends Product { // NoteBook notebook = new NoteBook() >> 가격을 강제로 입력
	NoteBook() {
		super(150);
	}

	@Override
	public String toString() {
		return "NoteBook";
	}
}

public class Ex12_Inherit_KeyPoint {

	public static void main(String[] args) {
		KtTv kttv = new KtTv();
		System.out.println(kttv.toString());

		Audio audio = new Audio();
		System.out.println(audio.toString());
		
		NoteBook notebook = new NoteBook();
		System.out.println(notebook.toString());
		
		Buyer buyer = new Buyer(); //고객
		
		//1차 오픈 테스트
		//구매행위
		/*
		buyer.kttvBuy(kttv);
		buyer.notebookBuy(notebook);
        buyer.audioBuy(audio);
        buyer.kttvBuy(kttv);
        buyer.kttvBuy(kttv);
        */
		//2차 개선코드
		buyer.Buy(kttv);
		buyer.Buy(notebook);
        buyer.Buy(audio);
        buyer.Buy(kttv);
        buyer.Buy(kttv);
        //3차 개선 코드
		
        
	}

}
