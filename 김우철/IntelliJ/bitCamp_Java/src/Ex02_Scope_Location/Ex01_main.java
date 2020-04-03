package Ex02_Scope_Location;
/*
클래스 == 설계도 == 타입

클래스 구성 요소 : [ 필드 + 함수 ]  + 생성자
*필드(field) >> 고유정보 , 상태정보 , 참조(부품)정보 자원 >> 변수
*함수(function) >> 기능 (행위 정보)
*추가적으로  생성자 >> 필드의 초기화를 목적으로 하는 함수

클래스 , 필드 , 생성자 , 함수 : 자신의 영역(범위) 정의(접근자 , 한정자 , 수정자)
>> public  , private ,  default , protected ....

1. public class Test{}

2. class Test{} >> 컴파일러가 내부적으로 default 접근자를 붙여서 사용
>>내부적으로 컴파일러가 실행하는 코드 : default class Test{}
>>default 개발자 직접 구현하지 않는다 ..
>>**default 접근자는 : [같은 폴더에서 접근 가능] , [다른 폴더에 있으면 서로 접근 불가]
>>**default 접근자는 : 같은 폴더 (package)내에서 [연습 목적] 으로

3. 하나의 물리적인 자바파일은 여러개의 클래스를 가질 수 있다 (Test.java) (0)
      단  public 하나만 존재  ..나머지는 default
*/
class Test{   //default Test >> 같은 폴더
    int d_iv;  //컴파일러가 자동으로 default int d_iv 해석
    public int p_iv;  //어디에서나 공유가능
    private int pri_iv; //개인적인 감추어진 숨김
}

public class Ex01_main {
    public static void main(String[] args) {
        Test t = new Test();
        t.d_iv = 100; //default (같은 폴더)
        t.p_iv = 200; //public
        //private 자원 접근 불가
    }
}
