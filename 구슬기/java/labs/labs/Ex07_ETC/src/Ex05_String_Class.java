/*
 String Ŭ����
  String str = new String("ȫ�浿");
  8���� �⺻ Ÿ�԰� �����ϰ� ����� �� �ֵ��� ����
  int i = 100;
  String str= "ȫ�浿";
  
  1.String Ŭ���� : ������ ���� ����: char[] �迭���� > ȫ�浿 > [ȫ][��][��] �̷��� ���������δ� �����Ѵ�.
  ex) String ename = "ABC">> char [] >> [A][B][C]
  class String extends object{
      char[] ...
      void length(){}
      @override
      String toString(){
                ������......
      }          
  }
  
 */
public class Ex05_String_Class {

	public static void main(String[] args) {
		String str = "ȫ�浿";
		System.out.println(str.length());  //3      //�����͸� char[]�� ������ �����ϱ� 
		System.out.println(str.toString()); //ȫ�浿 //������ 
		
		String str1 = "AAA";
		String str2 = "AAA";
		
		//equals �� ���� ����??  
		
		System.out.println(str1); //str1.toString()  ����
		System.out.println(str1.toString());
		System.out.println(str1 == str2); //true //String�� ���� ���ڿ��� ������ heap�� ���� �������� �ʴ´�. �׷��� true 
		//���ڿ� == �� ������ ���ϳ�?  �ּҰ� ��("xx����"=="xx����")
		//���� : ���ڿ� ������.. �ּҹ��������� �ƴѵ� (x)
		System.out.println(str1.equals(str2)); //true 
		//***** ������ heap �� �ִ� ���� �� ("AAA" == "AAA")
		
		//�׷���.. ��Ʈ���� ����� �������� ������� �ϸ�
		String str3 = new String("BBB"); //new ����ϸ� heap�� ���ο� ��ü�� ���� 
		String str4 = new String("BBB"); //���� ���ڿ��̾ new�� �־ ���� �����.
		System.out.println(str3 == str4); //false //�ּҰ� �ٸ��⶧����  "xx����" == "yy����" >>false
		System.out.println(str3.equals(str4));// true  //"BBB" =="BBB" >>true
		
		//�ͼ���
		String s = "A";
		s+= "B";
		s+= "C";
		System.out.println(s); //ABC
		
		s="A";
		System.out.println(s); //A
		

	}

}
