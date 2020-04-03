package Ex03_OOP_Basic;

/*
OOP(객체지향프로그래밍)
1. 상속 (재사용성)
2. 캡슐화(은닉화) : private : 직접할당을 막고 간접할당을 한다 : setter , getter (특수한 함수)
3. 다형성

다형성 한 부분으로 ..... [오버로딩]

>> method overloading
>> 하나의 이름으로 여러가지 기능을 하는 함수
>> System.out.println() >> println overloading 구현하고 있는 함수
특징 : 오버로딩은 성능향상에 도움을 준다 (x)
      why> 편하게 사용할려고 > 개발자
          고민 > 함수의 활용 > 여러개의 함수를 생성 (x) > 하나의 함수 (parameter 달리)

문법 : 함수이름은 같고 parameter 의 [개수] 와 [타입] 을 달리하는 방법
1. 함수이름은 같아야 한다
2. [parameter] 개수 또는 [Type] 은 달라야 한다
3. return type 오버로딩의 판단기준이 아니다 (x)
4. parameter 순서가 다름을 인정한다
*/
class Human {
    String name;
    int age;
}

class OverTest {
    int add(int i) {
        return 100 + i;
    }

    int add(int i, int j) {
        return i + j;
    }

    //String add(int k) {}  >> add(int i) 같은 녀석
    String add(String s) {  //parameter 개수 같지만 ... Type 다름은 인정한다
        return s + "hello";
    }

    void add(int i, String s) {
        System.out.println("오버로딩 : " + i + " / " + s);
    }

    void add(String s, int i) {  //타입의 순서가 다름을 인정한다
        System.out.println("나도 오버로딩 : " + s + " / " + i);
    }

    void add(Human h) {  //오버로딩
        h.name = "홍길동";
        h.age = 20;
        System.out.println(h.name + " / " + h.age);
    }
}

public class Ex14_Method_Overloading {
    public static void main(String[] args) {
        OverTest ot = new OverTest();
        int result = ot.add(10, 20);
        System.out.println("result : " + result);

        //ot.add(new Human()); ok
        Human h = new Human();
        ot.add(h);
    }
}