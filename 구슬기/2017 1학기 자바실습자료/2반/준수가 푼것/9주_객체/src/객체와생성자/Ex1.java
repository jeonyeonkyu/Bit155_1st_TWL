package 객체와생성자;

public class Ex1 {
	public static void main(String[] args){
		ConscriptManager person1 = new ConscriptManager();
		ConscriptManager person2 = new ConscriptManager("유재석");
		ConscriptManager person3 = new ConscriptManager("박명수",46);
		ConscriptManager person4 = new ConscriptManager("정준하",22,true);
		
		person1.printResult();
		person2.printResult();
		person3.printResult();
		person4.printResult();
		
	}
}


class ConscriptManager{
	private String name = "홍길동";
	private int age = 20;
	private boolean isMarried = false;
	
	ConscriptManager(){
		this("홍길동",20,false);
	}
	ConscriptManager(String nam){
		this(nam,20,false);
	}
	ConscriptManager(String nam,int ag){
		this(nam,ag,false);
	}
	ConscriptManager(String nam,int ag,boolean bool){
		this.name=nam;
		this.age=ag;
		this.isMarried=bool;
	}
	
	void printResult(){
		System.out.println("===징집검사 결과표===");
		System.out.println("이름: "+name);
		System.out.println("나이: "+age);
		if(isMarried){
			System.out.println("결혼유무 : 기혼");
		}else{
			System.out.println("결혼유무 : 미혼");
		}
		if(20<=age && age<30 &&!(isMarried)){
			System.out.println("징집검사 결과 합격입니다..");
		}else{
			System.out.println("징집검사 결과 불합격입니다..");
		}
		System.out.println("==============\n");
	}
}