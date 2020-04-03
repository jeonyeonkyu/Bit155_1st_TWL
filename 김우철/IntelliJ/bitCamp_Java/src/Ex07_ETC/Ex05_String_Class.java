package Ex07_ETC;

/*
String 클래스
String str = new String("홍길동");
8가지 기본 타입과 동일하게 사용할수 있도록 설계
int i = 100;
String str ="홍길동";

1. String 클래스 : 데이터 저장 구조  : char[] 배열저장 > 홍길동 > [홍][길][동]
ex) String ename ="ABC" >> char[] >> [A][B][C]
class String extends Object{
    char[] ...
    void length(){}
    @override
    String toString() {
    	재정의 ...
    }
}
*/
public class Ex05_String_Class {
    public static void main(String[] args) {
        String str = "홍길동";
        System.out.println(str.length());  //데이터가 char[] 로 관리
        System.out.println(str.toString()); //재정의

        String str1 = "AAA";
        String str2 = "AAA";

        System.out.println(str1); //str1.toString() 동일
        System.out.println(str1.toString());
        System.out.println(str1 == str2);
        //문자열  == 무었을 비교 >> 주소비교  ("xx번지" == "xx번지")
        //실제 : 문자열 값이지 ... 주소 ....(x)
        System.out.println(str1.equals(str2));
        //*****  실제로  heap 있는 값을 비교 ("AAA" == "AAA")

        //그런데 ....
        String str3 = new String("BBB"); //new 사용하면 새로운 객체 생성
        String str4 = new String("BBB");
        System.out.println(str3 == str4); //"xx번지" == "yy번지" >> false
        System.out.println(str3.equals(str4)); //"BBB" == "BBB" >> true

        //넌센스
        String s = "A";
        s += "B";
        s += "C";
        System.out.println(s);

        s = "A";
        System.out.println(s);
        //메모리 구조 그리기
    }
}
