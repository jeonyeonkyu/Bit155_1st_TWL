
import java.util.Scanner;

public class MAIN {

	public static void main(String[] args) {
		// TODO Auto-generated method 
	Scanner sc = new Scanner(System.in);

	System.out.print("�л� ���� �Է� �� �ּ��� : ");
	int j =sc.nextInt();
	int i = 0;
	Student[] StudentArr= new Student[j]; 
	
		for(i =0; i < StudentArr.length; i++){
			System.out.println((i+1)+"��° �л��� ������ �Է��ϼ���.");		
			String student = sc.next();
			StudentArr[i] = new Student();
			String[] strArr = student.split(","); 
			
			switch(strArr.length){

			case 1 :	StudentArr[i].setInfo(strArr[0]);
						break;
			case 2 : 	StudentArr[i].setInfo(strArr[0],strArr[1]);	
						break;
			case 3 : 	StudentArr[i].setInfo(strArr[0],strArr[1],strArr[2]);
						break;
			}
			StudentArr[i].describe();
			}



		}
		



	}


