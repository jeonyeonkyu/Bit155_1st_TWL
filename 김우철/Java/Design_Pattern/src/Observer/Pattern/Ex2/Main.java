//https://pjh3749.tistory.com/266

package Observer.Pattern.Ex2;

public class Main {
	public static void main(String[] args) {
		Baedi baedi = new Baedi();
		Crew lewin = new Lewin();
		Crew tiber = new Tiber();
		Crew jay = new Jay();
		
		baedi.subscribe(lewin); // lewin ��ġ���� ����
		baedi.subscribe(tiber); //tiber ��ġ���� ����
		baedi.subscribe(jay); // jay ��ġ���� ����
		
		baedi.upgradeCutie();

	}
}
