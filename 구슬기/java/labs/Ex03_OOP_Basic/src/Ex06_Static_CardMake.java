import kr.or.bit.Card;

public class Ex06_Static_CardMake {

	public static void main(String[] args) {
		//요구사항 card 제작(메모리에 올리는것)
		Card c = new Card();
		c.number = 1;
		c.kind = "heart";
		c.h=70;
		c.w=50;
		c.cardInfo();
		
		Card c2 = new Card();
		c2.number = 1;
		c2.kind = "heart";
		c2.cardInfo();
		
		//53개 제작 
		//고객의 요구사항이 바뀌었다 : 크기가 이게 아닌데요?? 라고 한다.
		//크기를 바꿔주세요
		//h = 70  w= 50
		//설계도를 다시 변경하고
		//53장을 다시 제작해야 되는건가?
		//각각의 카드 높이와 너비를 다 바꾸면 안되나? 53번 같은 작업을 반복해야 한다.

	}

}
