package Ex03_OOP_Basic;

import java.util.Scanner;

/*
1. 객체 자신을 가르키는 this
2. this 사용하는 다른 생성자를 호출
원칙 : 생성자는  객체생성시 1개만 호출
this .. 한번에 여러개의 생성자를 호출 ......
*/
// Zcar car = new Zcar();
// Zcar car = new Zcar("blue","auto",4);
class Zcar{
    String color;
    String geartype;
    int door;
    Zcar(){  //기본타입
        //this.color ="red";
        //this.geartype ="auto";
        //this.door = 2;
        //어 나를 다시 부르네 .....
        //Zcar("red","auto",2);
        this("red","auto",2);
        System.out.println("default constructor");
    }
    Zcar(String color , String geartype , int door){
        this.color = color;
        this.geartype = geartype;
        this.door = door;
        System.out.println("overloading constructor");
    }
    void print() {
        System.out.println(this.color + "/" + this.geartype + "/" + this.door);
    }
}

//*********** 코드량 감소 (생성자 >> this 활용 ) ****************
class Zcar2{
    String color;
    String geartype;
    int door;
    Zcar2(){
        this("red",1);
        System.out.println("default constructor");
    }
    Zcar2(String color , int door){
        this(color,"auto",door);
        System.out.println("overloading constructor param2개");
    }
    Zcar2(String color , String geartype , int door){
        this.color = color;
        this.geartype = geartype;
        this.door = door;
        System.out.println("overloading constructor param3개");
    }
    void print() {
        System.out.println(this.color + "/" + this.geartype + "/" + this.door);
    }


}


public class Ex19_this_Constructor {
    public static void main(String[] args) {


		/*
		Zcar car2 = new Zcar();
		car2.print();

		Zcar car = new Zcar("yellow","auto",1);
		car.print();
		*/
        //Zcar2 z = new Zcar2();
        //z.print();

        Zcar2 z2 = new Zcar2("pink",10);
        z2.print();

        //Zcar2 z3 = new Zcar2("blue","auto",3);
        //z3.print();

        //Scanner sc = new Scanner(System.in);
        //Boolean.parseBoolean(sc.nextLine());


    }

}









