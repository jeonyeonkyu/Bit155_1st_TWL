
public class GameCharcter implements Weapon {
	
	private Weapon weapon;
	
	public void setWeapon(Weapon weapon) {
		this.weapon = weapon;
	}

	@Override
	public void attack() {
		
		if(weapon == null) {System.out.println("�Ǽ����� ����.");}
		else {weapon.attack();}//��������Ʈ
	}

}//��������Ʈ ��� : attack�޼ҵ忡�� ���ȴ�. weapon�̶�� ������ Weapon�������̽��� �����ϰ��ִ� ��ü�� ����ְ�.
//�װ��� � ���������� � �˰����� �����ϴ��Ŀ����� ���������̴�.
