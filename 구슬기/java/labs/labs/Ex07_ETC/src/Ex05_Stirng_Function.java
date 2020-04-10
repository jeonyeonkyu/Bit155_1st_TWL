import java.util.StringTokenizer;

//String 클래스 (문자열)
//수 많은 함수....문자열 자르고 합치고 뽑아내고 ...해야함
//String : static 함수 (String.하고 쓸수있음)+ 일반 함수(String str = new String(); 하고 str.하고 쓰는거.)....

public class Ex05_Stirng_Function {

	public static void main(String[] args) {
		String str = ""; //문자열의 초기화, null
		//int , double 처럼 사용하세요.
		
		String[] strarr = {"aaa","bbb","ccc"};
		for(String s : strarr) {
			System.out.println(s);
		}
		
		//-----------함수------------------------------------ 
		
		//concat()
		String ss ="hello";
		String concatstr =ss.concat("world");
		System.out.println(concatstr);  //helloworld
		concatstr = ss.concat("meme");
		concatstr =ss.concat("mine"); //hellomine
		
		System.out.println(concatstr);
		
		
		//contains()     boolean 으로만 받을 수 있음-------------------------------------
		boolean bo = ss.contains("hel"); 
		System.out.println(bo);//true
		
	    bo = ss.contains("helo");
	    System.out.println(bo); //false
		
	    //contentEquals()  booleans 으로만 받을 수 있음  & 문자열 값 비교 . .equals 와 비슷.-------
	    bo = ss.contentEquals("he");
	    System.out.println("bo : " + bo); //false
	    
	    
	    //length()  길이알려주기 .. 공백까지 센다.-----------------------------------------
	    String ss2 = "a b c d"; //heap [a][ ][b][ ][c][ ][d]
	    System.out.println(ss2.length());//공백까지 7개 
	    
	    //indexOf()-----------------------------------------------------------------
	    String filename = "hello java world";
	    System.out.println(filename.indexOf("s"));  //-1 존재하지 않으니까.
	    System.out.println(filename.indexOf("h"));  //index라는 건 배열방의 첨자값. h는 0번째 방에 있다. 
	    System.out.println(filename.indexOf("java")); //java라는 문자열이 시작하는 인덱스 값 6
	    System.out.println(filename.indexOf("폭망"));//-1   없어서 이렇게 나온다.
	    //-1 return 원하는 값이 배열에 없어요
	    //신문기사 검색 indexof 사용시 0보다 큰값이.... 최소 한개의 문자는 있다.
	    if(filename.indexOf("wolrd")!= -1) {//활용예
	    	System.out.println("world 문자열이 포함되어 있다");
	    }
	    System.out.println(filename.lastIndexOf("a")); //끝에 있는 a의 인덱스값을 찾을 수 있다.  
	    //프로그램이 중간값은 못찾는다.    퍼스트 >넥스트로 가거나, 라스트에서 >앞으로 앞으로 해서 찾는다.
	    
	    //외우면 좋을것들
	    //length(), indexOf() , substring() , replace(), Split()
	    
	    
	    //substring() -------------------------------------------------------------  
	    String result = "superman";
	    System.out.println(result.substring(0));   //superman  //시작값부터 쫙 갖고온다.
	    System.out.println(result.substring(2));   //perman    //시작 값부터 쫙 갖고온다.
	    System.out.println(result.substring(1,2)); //endIndex -1  (1,1) 과 같다. //u
	    System.out.println(result.substring(0,0)); // (0,-1) 아무것도 안나와요.
	    System.out.println(result.substring(0,1)); //s
	    System.out.println(result.substring(1,1)); // 안나와요
	    System.out.println(result.substring(2,3)); //(2,2) p
	    
	    //Quiz
	    String filename2 = "1.txt"; //hong.png
	    //여기서 파일명과 확장자를 분리해서 출력해보세요
	    //1 파일명, txt 확장자 
	    //hong 파일명, png 확장자
	    //조건 단 위에서 배운것만 사용하세요       indextOf, length, substring
	    int position = filename2.indexOf(".");
	    String file = filename2.substring(0,position);
	    System.out.println(file);
	     String extention = filename2.substring(position +1,filename2.length()); //방법1
	     String extention2 = filename2.substring(++position); //방법2
	     
	     System.out.println(file);
	     System.out.println(extention);
	     System.out.println(extention2);
	     
	     //replace(치환함수)
	     
	     String s4 = "ABCDADDDDDA";
	     String result4 = s4.replace("DDDDD","오늘은 금요일 입니다.");
	     System.out.println("result4 :"+ result4); //result4 :ABCDA오늘은 금요일 입니다.A
	    
	     result4 = s4.replace("A","a");    
	     System.out.println("result4 :"+ result4); //result4 :aBCDaDDDDDa
	     
	     //ETC...
	     //String s4 = "ABCDADDDDDA";
	     System.out.println(s4.charAt(0)); //A
	     System.out.println(s4.charAt(3)); //D
	     System.out.println(s4.endsWith("DDDA"));//true  끝에서부터 일치하는거 찾기.
	     System.out.println(s4.endsWith("DDDD"));//false 
	     System.out.println(s4.equalsIgnoreCase("abcdADDDDDA"));//대소문자 구별없이 비교  그래서 //true  
	     
	     //Today Point (split)
	     String s6 = "슈퍼맨,팬티,노랑색,우하하,우하하"; //,를 기준으로 뽑아준다?
	     String[] namearray = s6.split(","); //배열이라는 그릇안에 집어넣는다.
	     for(String s : namearray) {
	    	 System.out.println(s);
	     }
	     //정규표현식  (java, javascript, Oracle, C#) 공통적인 규칙
	     //특수한 문자로 패턴을 미리 설계하는것 > 설계한 형식대로 입력이 들어오고있나 ?> 검증해보기
	     //주민번호 패턴 (숫자 6자리 -문자 숫자7자리) >>표현 >> 사용자 입력한 주민번호가 미리 정의한 패턴과 일치하는지 물어본다.
	     //전화번호 , 핸드폰번호, 차량번호, 우편번호, 도메인 주소 , 이메일 주소
	     //일치하면 true 
	     
	     //010-{\d4}-0000    정규표현으로 만들었을때      {정수값4개써!}
	     //010-444-0000  >>틀린표현이당 숫자 3개라서. false
	     //010-1111-0000 >>true  숫자 4개니까 ok.
	     
	     //패턴 과제....정규표현식 조사하기...나중에 내줄것임. 
	     
	     // . 정규표현 문법 >> \.   >> \.을 자바에서 인식하려면 밑의 표현들 처럼  \하나더 해야함  >> \\.
	     //\t, \n
	     
	     String filename3 = "bit.hwp";
	     String[] filearray = filename3.split("\\.");
	     System.out.println(filearray.length); // .으로 했을땐   0 이나옴.. 배열이 안만들어졌다는 얘기. //    \\.으로 하니까 제대로 나옴. 
	     for(String s : filearray) {
	    	 System.out.println(s);
	     }
	     
	     String s7 = "a/b,c.d-f"; //  a  b  c  d  f 추출해라.. 하면 기준점이 없는데..?  토크나이저와 함께라면 가능해! ㅋㅋㅋ...
	     StringTokenizer sto = new StringTokenizer(s7,"/,.-"); //첫번째 열 변수명,두번째 구분자값나열 
	     while(sto.hasMoreElements()){   //while문 만 사용가능하다.
	    	 System.out.println(sto.nextToken());
	     }
	     
	     //넌센스 
	     String s8 = "홍            길         동";
//	     >>"홍길동"
	     System.out.println(s8.replace(" ","")); 
	     
	     
	     String s9 ="                 홍길동                       ";
	     System.out.println(">"+s9+"<");         //>                 홍길동                       <
	     System.out.println(">"+s9.trim()+"<");  //>홍길동<
	     
	     
	     String s10 = "     홍    길     동      ";
	    //"홍길동"출력
	     String re = s10.trim();
	     String re2 = re.replace(" ", "");
	     System.out.println(re2);//되지만 무식하다..
	     
	     //************여러개의 함수를 연결해서 사용(method chain 기법)
	     System.out.println(s10.trim().replace(" ", ""));  //홍길동
	     System.out.println(s10.trim().replace(" ", "").substring(2));  //동
	     
	     //한번에 하는것 매소드 체인 기법.   
	    		 
	     
	     //Quiz-1
	     int sum=0;
	     String[] numarr = {"1","2","3","4","5"};
	     //문제: 배열에 있는 문자값들의 합을 sum 변수에 담아서 출력 : 결과15
	     int[] num = new int[numarr.length];
	     for(int i=0;i<numarr.length; i++){
	    	 num[i] = Integer.parseInt(numarr[i]); 
	    	 }
	     for(int a : num) {
	    	 sum += a;
	     }
	     System.out.println(sum);
	     
	     //선생님 답
	     for(String s : numarr) {
	    	 sum+=Integer.parseInt(s);
	     }
	     System.out.println(sum);
	     
	     //Quiz-2
	     String jumin="123456-1234567";
	     //위 주민번호의 합을 구하세요_1
	     int sum2=0;
	     for(int i=0; i< jumin.length();i++) {
	    	 String numstr =jumin.substring(i,i+1);
	    	 if(numstr.equals("-")) continue;
	    	 sum2+= Integer.parseInt(numstr);
	     }
	     System.out.println("주민번호 합" +sum2);
	     
	     //위주민번호의 합을 구하세요 _2
		 //String jumin="123456-1234567";
		   String[] numarr2 = jumin.replace("-","").split("");
		   int sum3=0;
		   for(String i : numarr2) {
			   sum3+= Integer.parseInt(i);
		   }
		   System.out.println("주민번호 합2:" + sum3);
		   
		 //위 주민번호의 합을 구하세요_3
		   String jumin4 = jumin.replace("-", "");
		   int sum4=0;
		   for(int i = 0 ; i < jumin4.length() ;i++) {
			   sum4+=Integer.parseInt(String.valueOf(jumin4.charAt(i)));//String.valueOf 00를 문자로 받기.
		   }
		   System.out.println("주민번호 합4:" + sum4);
	     
	     
	}

}
