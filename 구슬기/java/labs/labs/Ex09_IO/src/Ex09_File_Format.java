import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Ex09_File_Format {

	public static void main(String[] args) {
		//https://cafe.naver.com/opensourceweb/441  참조
		//화폐단위 처리
		
		/*
		DecimalFormat df = new DecimalFormat("#,###.0");
		String result = df.format(1234567.89);
		System.out.println(result); //1,234,567.9
		String result2 = df.format(1000000000000L);
		System.out.println(result2); //1,000,000,000,000.0
		*/
		
		
		//날짜 포맷형식으로 출력하기
		/*
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		Calendar cal = Calendar.getInstance(); 
		String sdate = sdf.format(cal.getTime());
		System.out.println(sdate);
		*/
		/*
		//문자열 형식(>> printf("%d",10) , Stirng.format
		//MessageFormat 클래스
		String userid = "kglim";
		String message = "회원 id : {0} \n 회원이름 : {1} \n 회원 전화번호: {2}";
		String result3 =MessageFormat.format(message, userid,"홍길동","111-1111");
        System.out.println(result3);  //회원 id : kglim   회원이름 : 홍길동   회원 전화번호: 111-1111
        */
		
		File dir = new File("C:\\Temp"); // 당신이 나에게 어떤 폴더를 주면 나는 그 폴더를 분석하겠다.  C://Temp 를 주고 분석해본거임
		File[] files = dir.listFiles();  //Temp 안의 폴더와 파일들이  files 배열에 들어가있다. 
		for(int i = 0;i<files.length ; i++) {
			File file = files[i];
			String name = file.getName(); //파일명, 폴더명일수도있다.
			SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd HH-mma");
			//Calendar cal = Calendar.getInstance();
			String attribute="";
			String size = "";
			if(files[i].isDirectory()) { //너 폴더니? 저 폴더에요 라고 했을때  //ex Temp
				attribute = "<DIR>";
			}else {  //a.txt, 1.jpg    파일들  
				size = file.length() + "byte";
				attribute = file.canRead() ? "R":"";    //읽을수 있니?
				attribute += file.canWrite() ? "W":"";  //쓸수있니?
				attribute += file.isHidden() ? "H":"";  //숨김파일이니?
			}
			System.out.printf("%s   %3s   %10s    %s    \n",
					dt.format(new Date(file.lastModified())),
							attribute,
							size,
							name);
		}
        
        
    

        
        
	}

}
