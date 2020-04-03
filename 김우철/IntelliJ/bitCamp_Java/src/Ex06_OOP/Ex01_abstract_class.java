package Ex06_OOP;

/*
추상클래스
>>미완성 클래스 (설계도)
1. 완성된 코드 + 미완성 코드
2. 완성 (함수) 실행블럭이 있는 함수  + 미완성 (함수) 실행블럭이 없는 함수 (public void run(); >> {X}
3. 완성 과 미완성 차이 (new 객체 생성 (완성) ,  미완성 (객체 생성 불가능)

정리
1. 추상클래스(미완성) 스스로 객체 생성 불가 (new 사용 불가)
2. 추상클래스는 결국 ...완성된 클래스가 되는 것이 목적 ... >> 상속이 목적
3. 상속관계에서 미완성된  자원 (추상자원) 완성해라(구현) >> 재정의 해라 (override)

설계자 입장에서 >
추상클래스 >> 만약에 추상 클래스 만든 다면 >> 나의 의도는 무었일까 >>  강제적 구현을 목적으로 (재정의 강제성)

*/
abstract class Abclass{
    //추상클래스 ... 추상자원을 만들겠다 ...
    int pos;
    void run() {
        pos++;
    }

    //미완성
    abstract void stop();  //추상자원   {} >> 실행블럭이 없다
}

//상속이 존재하지 않으면 >> 추상클래스는 태어나지도 않았다 ...
class Child extends Abclass {

    @Override
    void stop() { //실행블럭만  ... 그 안에 내용을 강제 ....
        this.pos = 0;
        System.out.println("stop : " + this.pos);
    }
}

class Child2 extends Abclass {
    @Override
    void stop() { //실행블럭만  ... 그 안에 내용을 강제 ....
        this.pos = -1;
        System.out.println("stop : " + this.pos);
    }
}

public class Ex01_abstract_class {
    public static void main(String[] args) {
        //Abclass ab = new Abclass(); 불가
        Child ch = new  Child();
        ch.run();
        ch.run();
        System.out.println(ch.pos);
        ch.stop();

        Child2 ch2 = new  Child2();
        ch2.run();
        ch2.run();
        System.out.println(ch2.pos);
        ch2.stop();

        //다형성
        Abclass ab = ch; //부모타입의 참조변수는 자식타입의 객체 주소를 가질 수 있다
        //부모는 자신의 타입자원들만 활용
        //************ 부모 접근 ... 그 자원이 ... 재정의 ... [자식자원] 접근 *******

        ab.run();
        ab.stop();
        //그런데 만약 ..부모 .. (super...)

    }
}
