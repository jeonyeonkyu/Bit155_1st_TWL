
public class TV {

		int inch;
		String color;
		String maker;
		
		public TV(){
			
			inch = 24;
			color = "Black";
			maker = "LG";
		}
		public TV(int minch,String mcolor){
			
			inch = minch;//���� ���� ���
			color = mcolor;
			maker = "SAMSUNG";
			
		}
		public TV(int minch, String mcolor, String mmaker){
			inch = minch;
			color = mcolor;
			maker = mmaker;
				
		}
		void describe() {
	
			System.out.println("=== TV ��ü ���� ===");
			System.out.println("ũ�� : " + inch);
			System.out.println("���� : "+ color);
			System.out.println("������ : " + maker);
			System.out.println("================");
		}
}


