import kr.or.bit.Singleton;

public class Ex14_Singleton_main {

	public static void main(String[] args) {
		//Singleton singleton = new    private ���� �س��� �Ⱥ��δ�.
		Singleton single = Singleton.getInstance(); 
		System.out.println(single);
		Singleton single2 = Singleton.getInstance(); 
		System.out.println(single);
		Singleton single3 = Singleton.getInstance(); 
		System.out.println(single);

		/* �̱����� ���ؼ� � ������ ������� �ɱ�? 
		   kr.or.bit.Singleton@15db9742
           kr.or.bit.Singleton@15db9742
           kr.or.bit.Singleton@15db9742

		 */
		
		
		
		
		
	}

}
