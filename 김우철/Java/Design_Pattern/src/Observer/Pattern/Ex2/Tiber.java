package Observer.Pattern.Ex2;

public class Tiber implements Crew{
	@Override
	public void update(String msg) {
		System.out.println("Tiber ¼ö½Å : " + msg);
	}

}
