package Ex04_Array;

class Person {
    String name;
    int age;

    void print() {
        System.out.println(this.name + " / " + this.age);
    }
}

public class Ex04_Array_Object {
    public static void main(String[] args) {
        int[] intarr = new int[10];
        boolean[] boarr = new boolean[5]; //false
        //값 타입 배열
        //값 타입 배열은 각각의 방이 [기본값]으로 초기화

        //참조 타입 배열
        Person p = new Person();
        p.name = "홍길동";
        p.age = 100;

        //참조 타입의 기본값 : null
        Person[] perobj = new Person[3];
        //person 객체를 담을 수 있는 방만 만든 것
        System.out.println("perobj : " + perobj);
        System.out.println("perobj[0] : " + perobj[0]);

        //*** 객체배열은 방을 만드는 작업과 방을 채우는 작업 별도
        perobj[0] = new Person();
        perobj[0].name = "홍길동";
        perobj[0].age = 100;
        System.out.println("perobj[0] " + perobj[0]);
        System.out.println(perobj[0].name + "/ " + perobj[0].age);

        System.out.println("perobj[1] " + perobj[1]);

        Person person = new Person();
        perobj[1] = person;

        perobj[2] = new Person();

        //for문
        for (int i = 0; i < perobj.length; i++) {
            System.out.println(perobj[i].name);
        }

        //객체 배열 (Today Point)
        //1. int[] arr = new int[5]
        Person[] pa_array = new Person[5];
        for (int i = 0; i < pa_array.length; i++) {
            pa_array[i] = new Person();
            System.out.println(pa_array[i]);
        }

        //2. int[] arr = new int[]{10,20,30}
        Person[] pa_array2 = new Person[]{new Person(), new Person(),
                new Person()};

        //3. int[] arr = {10,20,30}  //컴파일러 ...
        Person[] pa_array3 = {new Person(), new Person(), new Person()};
    }
}