package Ex09_IO;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Ex09_File_Format {

    public static void main(String[] args) {
        // https://cafe.naver.com/opensourceweb/441 참조
        //화페단위 처리
		/*
		DecimalFormat df = new DecimalFormat("#,###.0");
		String result = df.format(1234567.89);
		System.out.println(result);
		String result2 = df.format(10000000000L);
		System.out.println(result2);
		*/
        //날짜 처리
		/*
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		Calendar cal = Calendar.getInstance();
		String sdate = sdf.format(cal.getTime());
		System.out.println(sdate);
		*/

        //문자열 형식  (>> prinf("%d",10) , String.foramt
        //MessageFormat 클래스
		/*
		String userid="kglim";
		String message = " 회원 id : {0}  \n 회원이름 : {1} \n 회원 전화번호 : {2}";
		String result3 = MessageFormat.format(message, userid,"홍길동" ,"111-1111");
		System.out.println(result3);
		*/
        File dir = new File("C:\\Temp");
        File[] files = dir.listFiles(); //Temp 아래 있는 폴더와 파일이 배열에 ...
        for(int i = 0 ; i < files.length ; i++) {
            File file = files[i];
            String name = file.getName(); // 파일명, 폴더명
            SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH-mma");
            //Calendar cal = Calendar.getInstance();
            String attribute="";
            String size="";
            if(files[i].isDirectory()) { //저 폴더 예요  Temp
                attribute ="<DIR>";
            }else {  //a.txt , 1.jpg
                size = file.length() + "byte";
                attribute = file.canRead()   ? "R" : "";
                attribute += file.canWrite() ? "W" : "";
                attribute += file.isHidden() ? "H" : "";
            }

            System.out.printf("%s   %3s   %10s   %s   \n",
                    dt.format(new Date(file.lastModified())),
                    attribute,
                    size,
                    name
            );
        }

    }

}
