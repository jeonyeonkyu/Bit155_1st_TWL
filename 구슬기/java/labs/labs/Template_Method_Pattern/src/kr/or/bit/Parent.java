package kr.or.bit;

public class Parent {
	// 자식에서 공통적으로 사용하는 부분( someMethod )를 템플릿 메서드라 한다.
    public void someMethod(){
        System.out.println("부모에서 실행되는 부분 - 상");

        // 자식에서 구현해야 할 부분을 훅 메서드라 한다.
        hook();

        System.out.println("부모에서 실행되는 부분 - 하");
    }

    public void hook(){};
}
