import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
public class StudentList implements IList{
	
		String[] strStudentNumbers;
		String[] strPhoneNumbers;
		String[] arr = new String[3];
		String strTitle;
		String strDate;
		String[] strNames;
		int iCount;
		
		Scanner sc = new Scanner(System.in);

		public StudentList(String mTitle, String mDate,int mCount) {
			
			strTitle = mTitle;
			iCount = mCount;
			strDate = mDate;
			strNames = new String[mCount];
			strStudentNumbers = new String[mCount];
			strPhoneNumbers = new String[mCount];

		}

		public void splitAndSave(int iIndex, String mInput)	{
			
				strNames[iIndex]=arr[0];
				strStudentNumbers[iIndex] = arr[1];
				strPhoneNumbers[iIndex] = arr[2];
			
	
		}
			
			public void writeList(){
				// TODO Auto-generated method stub
				
				System.out.println("=== ���� �Է� ===");
				for(int i = 0; i<iCount; i++)
					{
						System.out.println((i+1)+"��° �л��� ������  \",\"�� �����Ͽ� �Է��ϼ���.(�̸�,�й�,��ȭ��ȣ )");
						arr = sc.next().split(",");
						for(int j=0; j<arr.length; j++){
							splitAndSave(i, arr[j]);
							
							
							}
				
						
						}
				try{
					FileWriter fw = new FileWriter("StudentList.txt",true);
							
					fw.write(" Title : "+strTitle + " \r\n"+ "Date : " + strDate +" \r\n"+ "Total : " + iCount +" \r\n");
					fw.write("�̸� \t"+ "�й�\t"+ "��ȭ��ȣ \t\r\n");
					for(int j=0; j<iCount; j++){
						fw.write(strNames[j]+"\t"+ strStudentNumbers[j]+"\t"+strPhoneNumbers[j]+"\t\r\n");
					}
					fw.close();
					}
				catch(IOException e){
					e.printStackTrace();
					
				
					}
			}
					

			
			public void readList(){
			
				System.out.println("=== �Էµ� ���� ===");
				System.out.println("�̸�\t\t�й�\t\t��ȭ��ȣ");
				Info();
				for(int i = 0; i<iCount; i++){
					System.out.println(strNames[i]+"\t\t"+strStudentNumbers[i]+"\t"+strPhoneNumbers[i]);
					try{
						FileReader fr = new FileReader("StudentList.txt");
							fr.read();
						fr.close();
						}
					catch(IOException e){
						e.printStackTrace();
				}
			}
			}

			@Override
			public void Info() {
				// TODO Auto-generated method stub
				
			}
		}
		