package Ex03_OOP_Basic;

/*
생성자 함수 (constructor)
1. 함수 (특수한 목적)
2. 특수한 목적 (member field 초기화)

Tip)  static { }  ,   { }

3. 일반함수와 다른점
3.1 함수의 이름이 고정( class 이름 동일)
3.2 실행시점 때문에 : return Type (x) >> void (x) >> 명시(쓰지) default void 생략
3.3 실행시점 : 객체생성(new) 되고 변수가 만들고 지고 [자동]으로 [ 호출되는 함수 ] >>생성자 함수

4. 목적 : 생성되는 객체마다 [강제적]으로 다른 member field 값을 (초기값) 부여하는 방법
class Car {String color;}
>> Car c = new Car(); 이사람이 차를 만들때 무조건  색상을 가지고 갔으면 좋겠는데 ....

5. 생성자 함수 >> overloading 가능

--당신이 만약 overloading 된 생성자 함수를 하나 라도 구현 했다면
--default 생성자함수는 반드시 구현을 통해서만 생성된다

*/
//설계자의 의도 : 자동차를 반드시 자동차 이름을 넣어라
class Car {
    String carname;
    //생략되어 있었어요
    //직접 코딩하지 않으면  컴파일러가 자동으로 코드를 만들어요
    //Car(){}
}

class Car2 {
    String carname;

    Car2() { //void 생략
        System.out.println("나는 default 생성자 입니다 (자동호출)");
        carname = "포니"; //생성자 member field 의 초기값 ....
    }
}

class Car4 {
    int door;
    int wheel;

    Car4() {
        System.out.println("default");
    }
    //method overloading (함수)
    //오버로딩

    Car4(int num) {
        door = num;
        System.out.println("overloading door : " + door);
    }

    Car4(int num, int num2) {
        door = num;
        wheel = num2;
        System.out.println("overloading door wheel : " + door + "/" + wheel);
    }
}

public class Ex16_Constructor_overloading {
    public static void main(String[] args) {
        //Car c1 = new Car();
        //c1.carname = "소나타"; 강제하지 않는다

        //Car2 c2 = new Car2(); //Car2() 생성자 함수를 호출 ,,,,,,,
        //System.out.println(c2.carname);

        //원칙적으로는 객체를 생성할때 생성자함수는 1개만 호출
        Car4 c4 = new Car4();
        //Car4 c4 = new Car4(100);
        //Car4 c4 = new Car4(10, 20);

        //**자동차 주문제작**
        //Case
        //Case  기본자동차
        //Case1 자동차 색상
        //Case2 자동차 색상 , 썬팅
        //Case3 자동차색상 , 썬팅 , 네비 장착

        //생성자 overloading 활용 (강제성)

    }
}