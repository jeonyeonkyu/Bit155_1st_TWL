package Observer.Pattern.Ex2;

public class Jay implements Crew {
	@Override
	public void update(String msg) {
		System.out.println("Jay ¼ö½Å : " + msg);
	}
}
