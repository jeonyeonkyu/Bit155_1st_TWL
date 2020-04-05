
public class GameCharcter implements Weapon {
	
	private Weapon weapon;
	
	public void setWeapon(Weapon weapon) {
		this.weapon = weapon;
	}

	@Override
	public void attack() {
		
		if(weapon == null) {System.out.println("맨손으로 공격.");}
		else {weapon.attack();}//델리게이트
	}

}//델리게이트 방식 : attack메소드에서 사용된다. weapon이라는 변수는 Weapon인터페이스를 구현하고있는 객체가 들어있고.
//그것이 어떤 무기인지는 어떤 알고리즘을 수행하느냐에따라 정해질것이다.
