

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
		System.out.println("=== �Էµ� �л����� ���� ===");
		System.out.println("�̸� \t�� ��\t ��ȭ��ȣ");
		System.out.println(name+"  \t"+studentNum+"  \t"+phonNum);


	}
}
