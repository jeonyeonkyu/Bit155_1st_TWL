//https://pjh3749.tistory.com/266

package Observer.Pattern.Ex2;

public class Main {
	public static void main(String[] args) {
		Baedi baedi = new Baedi();
		Crew lewin = new Lewin();
		Crew tiber = new Tiber();
		Crew jay = new Jay();
		
		baedi.subscribe(lewin); // lewin 코치에게 구독
		baedi.subscribe(tiber); //tiber 코치에게 구독
		baedi.subscribe(jay); // jay 코치에게 구독
		
		baedi.upgradeCutie();

	}
}
