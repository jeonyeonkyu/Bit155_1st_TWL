package Observer.Pattern.Ex2;

import java.util.ArrayList;
import java.util.List;

public class Baedi implements Coach {
	private List<Crew> crews = new ArrayList<>();

	public void eatFood() {
		System.out.println("������ġ�� ���� �Դ´�.");
		notifyCrew("�� �� �Ծ���");
	}

	public void runaway() {
		System.out.println("������ġ�� ���̸� ģ��");
		notifyCrew("�� ���� �ƴ�");
	}

	public void upgradeCutie() {
		System.out.println("������ġ�� �Ϳ����� ��ȭ�ߴ�");
		notifyCrew("�� �� �Ϳ��� ����");
	}

	@Override
	public void subscribe(Crew crew) {
		crews.add(crew);
	}

	@Override
	public void unsubscribe(Crew crew) {
		crews.remove(crew);
	}

	@Override
	//Crew�鿡�� �˸��� ������ �޼���
	public void notifyCrew(String msg) {
		crews.forEach(crew -> crew.update(msg));
	}

}
