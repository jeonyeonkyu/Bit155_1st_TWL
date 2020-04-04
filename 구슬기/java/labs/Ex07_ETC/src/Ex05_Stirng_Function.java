import java.util.StringTokenizer;

//String Ŭ���� (���ڿ�)
//�� ���� �Լ�....���ڿ� �ڸ��� ��ġ�� �̾Ƴ��� ...�ؾ���
//String : static �Լ� (String.�ϰ� ��������)+ �Ϲ� �Լ�(String str = new String(); �ϰ� str.�ϰ� ���°�.)....

public class Ex05_Stirng_Function {

	public static void main(String[] args) {
		String str = ""; //���ڿ��� �ʱ�ȭ, null
		//int , double ó�� ����ϼ���.
		
		String[] strarr = {"aaa","bbb","ccc"};
		for(String s : strarr) {
			System.out.println(s);
		}
		
		//-----------�Լ�------------------------------------ 
		
		//concat()
		String ss ="hello";
		String concatstr =ss.concat("world");
		System.out.println(concatstr);  //helloworld
		concatstr = ss.concat("meme");
		concatstr =ss.concat("mine"); //hellomine
		
		System.out.println(concatstr);
		
		
		//contains()     boolean ���θ� ���� �� ����-------------------------------------
		boolean bo = ss.contains("hel"); 
		System.out.println(bo);//true
		
	    bo = ss.contains("helo");
	    System.out.println(bo); //false
		
	    //contentEquals()  booleans ���θ� ���� �� ����  & ���ڿ� �� �� . .equals �� ���.-------
	    bo = ss.contentEquals("he");
	    System.out.println("bo : " + bo); //false
	    
	    
	    //length()  ���̾˷��ֱ� .. ������� ����.-----------------------------------------
	    String ss2 = "a b c d"; //heap [a][ ][b][ ][c][ ][d]
	    System.out.println(ss2.length());//������� 7�� 
	    
	    //indexOf()-----------------------------------------------------------------
	    String filename = "hello java world";
	    System.out.println(filename.indexOf("s"));  //-1 �������� �����ϱ�.
	    System.out.println(filename.indexOf("h"));  //index��� �� �迭���� ÷�ڰ�. h�� 0��° �濡 �ִ�. 
	    System.out.println(filename.indexOf("java")); //java��� ���ڿ��� �����ϴ� �ε��� �� 6
	    System.out.println(filename.indexOf("����"));//-1   ��� �̷��� ���´�.
	    //-1 return ���ϴ� ���� �迭�� �����
	    //�Ź���� �˻� indexof ���� 0���� ū����.... �ּ� �Ѱ��� ���ڴ� �ִ�.
	    if(filename.indexOf("wolrd")!= -1) {//Ȱ�뿹
	    	System.out.println("world ���ڿ��� ���ԵǾ� �ִ�");
	    }
	    System.out.println(filename.lastIndexOf("a")); //���� �ִ� a�� �ε������� ã�� �� �ִ�.  
	    //���α׷��� �߰����� ��ã�´�.    �۽�Ʈ >�ؽ�Ʈ�� ���ų�, ��Ʈ���� >������ ������ �ؼ� ã�´�.
	    
	    //�ܿ�� �����͵�
	    //length(), indexOf() , substring() , replace(), Split()
	    
	    
	    //substring() -------------------------------------------------------------  
	    String result = "superman";
	    System.out.println(result.substring(0));   //superman  //���۰����� �� ����´�.
	    System.out.println(result.substring(2));   //perman    //���� ������ �� ����´�.
	    System.out.println(result.substring(1,2)); //endIndex -1  (1,1) �� ����. //u
	    System.out.println(result.substring(0,0)); // (0,-1) �ƹ��͵� �ȳ��Ϳ�.
	    System.out.println(result.substring(0,1)); //s
	    System.out.println(result.substring(1,1)); // �ȳ��Ϳ�
	    System.out.println(result.substring(2,3)); //(2,2) p
	    
	    //Quiz
	    String filename2 = "1.txt"; //hong.png
	    //���⼭ ���ϸ�� Ȯ���ڸ� �и��ؼ� ����غ�����
	    //1 ���ϸ�, txt Ȯ���� 
	    //hong ���ϸ�, png Ȯ����
	    //���� �� ������ ���͸� ����ϼ���       indextOf, length, substring
	    int position = filename2.indexOf(".");
	    String file = filename2.substring(0,position);
	    System.out.println(file);
	     String extention = filename2.substring(position +1,filename2.length()); //���1
	     String extention2 = filename2.substring(++position); //���2
	     
	     System.out.println(file);
	     System.out.println(extention);
	     System.out.println(extention2);
	     
	     //replace(ġȯ�Լ�)
	     
	     String s4 = "ABCDADDDDDA";
	     String result4 = s4.replace("DDDDD","������ �ݿ��� �Դϴ�.");
	     System.out.println("result4 :"+ result4); //result4 :ABCDA������ �ݿ��� �Դϴ�.A
	    
	     result4 = s4.replace("A","a");    
	     System.out.println("result4 :"+ result4); //result4 :aBCDaDDDDDa
	     
	     //ETC...
	     //String s4 = "ABCDADDDDDA";
	     System.out.println(s4.charAt(0)); //A
	     System.out.println(s4.charAt(3)); //D
	     System.out.println(s4.endsWith("DDDA"));//true  ���������� ��ġ�ϴ°� ã��.
	     System.out.println(s4.endsWith("DDDD"));//false 
	     System.out.println(s4.equalsIgnoreCase("abcdADDDDDA"));//��ҹ��� �������� ��  �׷��� //true  
	     
	     //Today Point (split)
	     String s6 = "���۸�,��Ƽ,�����,������,������"; //,�� �������� �̾��ش�?
	     String[] namearray = s6.split(","); //�迭�̶�� �׸��ȿ� ����ִ´�.
	     for(String s : namearray) {
	    	 System.out.println(s);
	     }
	     //����ǥ����  (java, javascript, Oracle, C#) �������� ��Ģ
	     //Ư���� ���ڷ� ������ �̸� �����ϴ°� > ������ ���Ĵ�� �Է��� �������ֳ� ?> �����غ���
	     //�ֹι�ȣ ���� (���� 6�ڸ� -���� ����7�ڸ�) >>ǥ�� >> ����� �Է��� �ֹι�ȣ�� �̸� ������ ���ϰ� ��ġ�ϴ��� �����.
	     //��ȭ��ȣ , �ڵ�����ȣ, ������ȣ, �����ȣ, ������ �ּ� , �̸��� �ּ�
	     //��ġ�ϸ� true 
	     
	     //010-{\d4}-0000    ����ǥ������ ���������      {������4����!}
	     //010-444-0000  >>Ʋ��ǥ���̴� ���� 3����. false
	     //010-1111-0000 >>true  ���� 4���ϱ� ok.
	     
	     //���� ����....����ǥ���� �����ϱ�...���߿� ���ٰ���. 
	     
	     // . ����ǥ�� ���� >> \.   >> \.�� �ڹٿ��� �ν��Ϸ��� ���� ǥ���� ó��  \�ϳ��� �ؾ���  >> \\.
	     //\t, \n
	     
	     String filename3 = "bit.hwp";
	     String[] filearray = filename3.split("\\.");
	     System.out.println(filearray.length); // .���� ������   0 �̳���.. �迭�� �ȸ�������ٴ� ���. //    \\.���� �ϴϱ� ����� ����. 
	     for(String s : filearray) {
	    	 System.out.println(s);
	     }
	     
	     String s7 = "a/b,c.d-f"; //  a  b  c  d  f �����ض�.. �ϸ� �������� ���µ�..?  ��ũ�������� �Բ���� ������! ������...
	     StringTokenizer sto = new StringTokenizer(s7,"/,.-"); //ù��° �� ������,�ι�° �����ڰ����� 
	     while(sto.hasMoreElements()){   //while�� �� ��밡���ϴ�.
	    	 System.out.println(sto.nextToken());
	     }
	     
	     //�ͼ��� 
	     String s8 = "ȫ            ��         ��";
//	     >>"ȫ�浿"
	     System.out.println(s8.replace(" ","")); 
	     
	     
	     String s9 ="                 ȫ�浿                       ";
	     System.out.println(">"+s9+"<");         //>                 ȫ�浿                       <
	     System.out.println(">"+s9.trim()+"<");  //>ȫ�浿<
	     
	     
	     String s10 = "     ȫ    ��     ��      ";
	    //"ȫ�浿"���
	     String re = s10.trim();
	     String re2 = re.replace(" ", "");
	     System.out.println(re2);//������ �����ϴ�..
	     
	     //************�������� �Լ��� �����ؼ� ���(method chain ���)
	     System.out.println(s10.trim().replace(" ", ""));  //ȫ�浿
	     System.out.println(s10.trim().replace(" ", "").substring(2));  //��
	     
	     //�ѹ��� �ϴ°� �żҵ� ü�� ���.   
	    		 
	     
	     //Quiz-1
	     int sum=0;
	     String[] numarr = {"1","2","3","4","5"};
	     //����: �迭�� �ִ� ���ڰ����� ���� sum ������ ��Ƽ� ��� : ���15
	     int[] num = new int[numarr.length];
	     for(int i=0;i<numarr.length; i++){
	    	 num[i] = Integer.parseInt(numarr[i]); 
	    	 }
	     for(int a : num) {
	    	 sum += a;
	     }
	     System.out.println(sum);
	     
	     //������ ��
	     for(String s : numarr) {
	    	 sum+=Integer.parseInt(s);
	     }
	     System.out.println(sum);
	     
	     //Quiz-2
	     String jumin="123456-1234567";
	     //�� �ֹι�ȣ�� ���� ���ϼ���_1
	     int sum2=0;
	     for(int i=0; i< jumin.length();i++) {
	    	 String numstr =jumin.substring(i,i+1);
	    	 if(numstr.equals("-")) continue;
	    	 sum2+= Integer.parseInt(numstr);
	     }
	     System.out.println("�ֹι�ȣ ��" +sum2);
	     
	     //���ֹι�ȣ�� ���� ���ϼ��� _2
		 //String jumin="123456-1234567";
		   String[] numarr2 = jumin.replace("-","").split("");
		   int sum3=0;
		   for(String i : numarr2) {
			   sum3+= Integer.parseInt(i);
		   }
		   System.out.println("�ֹι�ȣ ��2:" + sum3);
		   
		 //�� �ֹι�ȣ�� ���� ���ϼ���_3
		   String jumin4 = jumin.replace("-", "");
		   int sum4=0;
		   for(int i = 0 ; i < jumin4.length() ;i++) {
			   sum4+=Integer.parseInt(String.valueOf(jumin4.charAt(i)));//String.valueOf 00�� ���ڷ� �ޱ�.
		   }
		   System.out.println("�ֹι�ȣ ��4:" + sum4);
	     
	     
	}

}
