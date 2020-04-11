

public class Student {

	String name ="";
	String studentNum ="";
	String phonNum ="";
	
	void setInfo(String mname){
		name = mname;
	}
	
	void setInfo(String mname, String mstudentNum){
		name = mname;
		studentNum = mstudentNum;
		
	}
	
	void setInfo(String mname, String mstudentNum, String mphonNum){
		name = mname;
		studentNum = mstudentNum;
		phonNum = mphonNum;
	}
	
	void describe(){
		System.out.println("=== 입력된 학생들의 정보 ===");
		System.out.println("이름 \t학 번\t 전화번호");
		System.out.println(name+"  \t"+studentNum+"  \t"+phonNum);


	}
}
