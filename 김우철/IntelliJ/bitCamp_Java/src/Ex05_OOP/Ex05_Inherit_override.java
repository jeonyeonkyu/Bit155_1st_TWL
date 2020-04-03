package Ex05_OOP;

class Test2{
    int x = 100;
    void print() {
        System.out.println("부모함수(Test2)");
    }
}

class Test3 extends Test2{
    int x = 300; //부모 무시하기  //하지 마세요 ......
    @Override
    void print() {
        System.out.println("자식이 부모함수 재정의 ...");
    }

    //오버로딩 (상속과 상관이 없다)
    void print(String str) {
        System.out.println("나 오버로딩 함수야 ^^" + str);
    }
}

public class Ex05_Inherit_override {
    public static void main(String[] args) {
        Test3 test3 = new Test3();
        test3.print();
        test3.print("오버로딩");
        System.out.println(test3.x); //300출력
    }
}
