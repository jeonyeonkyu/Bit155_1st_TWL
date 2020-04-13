package Observer.Pattern.Ex2;

import java.util.List;

public class Baedi implements Coach{
	private List<Crew> crews = new ArrayList<>();
	
	public void eatFood() {
		System.out.println("º£µðÄÚÄ¡°¡ ¹äÀ» ¸Ô´Â´Ù.");
		notifyCrew("³ª ¹ä ¸Ô¾úµû");
	}
	
	public void runaway() {
		System.out.println("º£µðÄÚÄ¡°¡ ³ó¶¯ÀÌ¸¦ Ä£´Ù");
		notifyCrew("³ª ³ó¶¯ÀÌ ÃÆ´Ù");
	}
	
	public void upgradeCutie() {
		System.out.println("º£µðÄÚÄ¡°¡ ±Í¿©¿òÀ» °­È­Çß´Ù");
		notifyCrew("³ª ´õ ±Í¿©¿ö Á³´Ù");
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
	public void notifyCrew(String msg) {
		crews.forEach(crew ->);	
		
	}

}
