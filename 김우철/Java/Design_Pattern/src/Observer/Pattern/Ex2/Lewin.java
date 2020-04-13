package Observer.Pattern.Ex2;

public class Lewin implements Crew {
	@Override
	public void update(String msg) {
		System.out.println("Lewin ¼ö½Å : " + msg);
	}

}
