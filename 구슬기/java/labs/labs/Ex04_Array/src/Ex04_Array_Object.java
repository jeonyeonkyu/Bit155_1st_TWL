class Person{
	String name;
	int age;
	void print() {
		System.out.println(this.name + "/" + this.age);
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
		p.name = "홍기동";
		p.age = 100;
		
		//참조 타입의 기본값 : null
		Person[] perobj = new Person[3];
		//person 객체를 담을 수 있는 방만 만든 것
		System.out.println("perobj : "+ perobj); //perobj : [LPerson;@15db9742
		System.out.println("perobj[0] : "+ perobj[0]); //perobj[0] : null
		
		//*** 객체배열은 방을 만드는 작업과 방을 채우는 초기화 작업 별도
		perobj[0] = new Person();
		perobj[0].name ="홍길동";
		perobj[0].age = 100;
		System.out.println("perobj[0] "+ perobj[0]);
		System.out.println(perobj[0].name+ "/" +perobj[0].age);
		//이시점에서 perobj[0]만 주소값 가지고있음
		System.out.println("perobj[1] "+ perobj[1]); //null
		
		Person person = new Person();
		perobj[1] = person;               //27번과 다른방법으로 힙에 객체 생성한것임
		
		perobj[2] = new Person();
		
		//for문
		for(int i =0;i<perobj.length;i++) {
			System.out.println(perobj[i]);  //객체의 주소값이 찍힌다.
		}
		for(int i =0;i<perobj.length;i++) {
			System.out.println(perobj[i].name);  //객체의 주소값이 찍힌다.
		}
		
		//객체배열(Today Point)
		//1.int[] arr = new int[5];
		Person[] pa_array = new Person[5]; //객체를 담는 그릇만 갖고 있음 null 값임  //person자리에 클래스 이름이 오면됨
		for(int i = 0; i<pa_array.length;i++) {
			pa_array[i] = new Person();
			System.out.println(pa_array[i]); //이러면 주소값이 나옴
		}
		
		//2.int[] arr = new int[]{10,20,30};
		Person[] pa_array2 = new Person[] {new Person(),new Person(),new Person()};
		//참조타입 배열은 객체의 주소값으로 초기화시킨다.
		
		//3.int[] arr = {10,20,30}; //컴파일러...가 해주길 기다린당
		Person[] pa_array3 = {new Person(),new Person(),new Person()};

	}

}
