import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Ex09_File_Format {

	public static void main(String[] args) {
		//https://cafe.naver.com/opensourceweb/441  ����
		//ȭ����� ó��
		
		/*
		DecimalFormat df = new DecimalFormat("#,###.0");
		String result = df.format(1234567.89);
		System.out.println(result); //1,234,567.9
		String result2 = df.format(1000000000000L);
		System.out.println(result2); //1,000,000,000,000.0
		*/
		
		
		//��¥ ������������ ����ϱ�
		/*
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd��");
		Calendar cal = Calendar.getInstance(); 
		String sdate = sdf.format(cal.getTime());
		System.out.println(sdate);
		*/
		/*
		//���ڿ� ����(>> printf("%d",10) , Stirng.format
		//MessageFormat Ŭ����
		String userid = "kglim";
		String message = "ȸ�� id : {0} \n ȸ���̸� : {1} \n ȸ�� ��ȭ��ȣ: {2}";
		String result3 =MessageFormat.format(message, userid,"ȫ�浿","111-1111");
        System.out.println(result3);  //ȸ�� id : kglim   ȸ���̸� : ȫ�浿   ȸ�� ��ȭ��ȣ: 111-1111
        */
		
		File dir = new File("C:\\Temp"); // ����� ������ � ������ �ָ� ���� �� ������ �м��ϰڴ�.  C://Temp �� �ְ� �м��غ�����
		File[] files = dir.listFiles();  //Temp ���� ������ ���ϵ���  files �迭�� ���ִ�. 
		for(int i = 0;i<files.length ; i++) {
			File file = files[i];
			String name = file.getName(); //���ϸ�, �������ϼ����ִ�.
			SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd HH-mma");
			//Calendar cal = Calendar.getInstance();
			String attribute="";
			String size = "";
			if(files[i].isDirectory()) { //�� ������? �� �������� ��� ������  //ex Temp
				attribute = "<DIR>";
			}else {  //a.txt, 1.jpg    ���ϵ�  
				size = file.length() + "byte";
				attribute = file.canRead() ? "R":"";    //������ �ִ�?
				attribute += file.canWrite() ? "W":"";  //�����ִ�?
				attribute += file.isHidden() ? "H":"";  //���������̴�?
			}
			System.out.printf("%s   %3s   %10s    %s    \n",
					dt.format(new Date(file.lastModified())),
							attribute,
							size,
							name);
		}
        
        
    

        
        
	}

}
