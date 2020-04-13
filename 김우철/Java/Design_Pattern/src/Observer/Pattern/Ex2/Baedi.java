package Observer.Pattern.Ex2;

import java.util.ArrayList;
import java.util.List;

public class Baedi implements Coach {
	private List<Crew> crews = new ArrayList<>();

	public void eatFood() {
		System.out.println("베디코치가 밥을 먹는다.");
		notifyCrew("나 밥 먹었따");
	}

	public void runaway() {
		System.out.println("베디코치가 농땡이를 친다");
		notifyCrew("나 농땡이 쳤다");
	}

	public void upgradeCutie() {
		System.out.println("베디코치가 귀여움을 강화했다");
		notifyCrew("나 더 귀여워 졌다");
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
	//Crew들에게 알림을 보내는 메서드
	public void notifyCrew(String msg) {
		crews.forEach(crew -> crew.update(msg));
	}

}
