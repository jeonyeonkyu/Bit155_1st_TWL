
public class MAIN {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		TV lgTV = new TV();
		TV samsungTV = new TV(32, "White");
		TV miTV = new TV(65, "Black", "Xiaomi");
		
		lgTV.describe();
		samsungTV.describe();
		miTV.describe();
		
			
	}

}
