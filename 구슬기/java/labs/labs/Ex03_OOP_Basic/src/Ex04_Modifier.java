import kr.or.bit.Car;

/*
 접근자 (한정자) :modifier
 public (공유 : package (폴더)에 대한 구분 없이 모든 자원을 공유하겠음)
 private (개인 : 클래스 내부에서는 공유자원임(같은반 안이라서 다보임). 참조변수 입장에서 접근 불가능(사용불가)
 
 객체지향언어가 가지는 특징
 1. 캡슐화( 은닉화)
 1.1 클래스 내부에 있는 자원(member field , method) 적용
      private int number;  직접할당을 막고 간접할당을 통해서 자원을 보호하겠다.(방법은 :setter, getter)
      private void call(); 다른 함수의 보조 ,공통함수
 1.2 [직접할당]
      public class Car { public int door;} >> Car c = new Car(); c.door=100;
      만약에 -1을 넣으면...원치않을때.. c.door = -1 넣으면 ㅜㅜ
      public class Car { private int door; 
      
                        public void writeDoor(int data){ //door 라는 변수 에서 write
                        if(data >=0){
                        door = data;
                        }else{
                        door = 0;
                        }
                        public int readDoor(){  //door 라는 변수에서 read
                        return door;
                        }
                        
                       } 
                       
    >> Car c  = new Car();  c.writeDoor(10);  c.writeDoor(-1);   >>door >>0 
                                 int result = c.readDoor();
                                 
   >> private 변수 하나당>> 함수2개(read,write)
   >> java 에서는 특수한 목적의 함수 를 만듦: setter(private 자원에 대한 write 쓰기목적), getter (private 자원에 대한 read 읽기목적)      
   >> 쓰기전용 , 읽기전용
   >> private int age
   >> setter, getter 모두 생성해도 되고(보통은 두개 다 만든다)
   >> setter 만 생성해도 되고
   >> getter 만 생성해도 된다 > private int age = 100
   
                
    우리가 가진 자원을 보호하기 위해 쓰는건데 막으면 막히고, 중간전달해주는 기능을 함수가 해주더라.    
    하나의 멤버필드가 프라이빗될때 두개의 함수를 가진다. 읽는것 쓰는것.              
 */
public class Ex04_Modifier {

	public static void main(String[] args) {
		Car c = new Car();
		/*
		c.writeSpeed(100);
		int result = c.readSpeed();
		System.out.println("현재속도 : "+result);
        */
		c.setSpeed(-100);  //쓰기전용이라서 얘한테 씀
		int result = c.getSpeed();  //얘를 이용해서 result에 값을 넣어줌.
		System.out.println("속도 : "+ result);
		
		c.speedUp();
		c.speedUp();
		c.speedUp();
		result = c.getSpeed();
		System.out.println("속도:"+ result) ;
		
		c.speedDown();
		c.speedDown();
		c.speedDown();
		c.speedDown();
		result = c.getSpeed();
		System.out.println("속도:"+ result) ;
		
	}

}
