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
			}

			
			public void readList(){
			
				System.out.println("=== �Էµ� ���� ===");
				System.out.println("�̸�\t\t�й�\t\t��ȭ��ȣ");
				Info();
				for(int i = 0; i<iCount; i++){
					System.out.println(strNames[i]+"\t\t"+strStudentNumbers[i]+"\t"+strPhoneNumbers[i]);
				}
			}

			@Override
			public void Info() {
				// TODO Auto-generated method stub
				
			}
		}
		