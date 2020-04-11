
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
			
			inch = minch;//값을 받은 경우
			color = mcolor;
			maker = "SAMSUNG";
			
		}
		public TV(int minch, String mcolor, String mmaker){
			inch = minch;
			color = mcolor;
			maker = mmaker;
				
		}
		void describe() {
	
			System.out.println("=== TV 객체 정보 ===");
			System.out.println("크기 : " + inch);
			System.out.println("색상 : "+ color);
			System.out.println("제조사 : " + maker);
			System.out.println("================");
		}
}


