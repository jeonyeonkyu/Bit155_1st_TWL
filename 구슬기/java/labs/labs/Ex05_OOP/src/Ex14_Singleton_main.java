import kr.or.bit.Singleton;

public class Ex14_Singleton_main {

	public static void main(String[] args) {
		//Singleton singleton = new    private 으로 해놔서 안보인다.
		Singleton single = Singleton.getInstance(); 
		System.out.println(single);
		Singleton single2 = Singleton.getInstance(); 
		System.out.println(single);
		Singleton single3 = Singleton.getInstance(); 
		System.out.println(single);

		/* 싱글톤을 통해서 어떤 장점을 만드려는 걸까? 
		   kr.or.bit.Singleton@15db9742
           kr.or.bit.Singleton@15db9742
           kr.or.bit.Singleton@15db9742

		 */
		
		
		
		
		
	}

}
