import kr.or.bit.Car;

/*
 ������ (������) :modifier
 public (���� : package (����)�� ���� ���� ���� ��� �ڿ��� �����ϰ���)
 private (���� : Ŭ���� ���ο����� �����ڿ���(������ ���̶� �ٺ���). �������� ���忡�� ���� �Ұ���(���Ұ�)
 
 ��ü����� ������ Ư¡
 1. ĸ��ȭ( ����ȭ)
 1.1 Ŭ���� ���ο� �ִ� �ڿ�(member field , method) ����
      private int number;  �����Ҵ��� ���� �����Ҵ��� ���ؼ� �ڿ��� ��ȣ�ϰڴ�.(����� :setter, getter)
      private void call(); �ٸ� �Լ��� ���� ,�����Լ�
 1.2 [�����Ҵ�]
      public class Car { public int door;} >> Car c = new Car(); c.door=100;
      ���࿡ -1�� ������...��ġ������.. c.door = -1 ������ �̤�
      public class Car { private int door; 
      
                        public void writeDoor(int data){ //door ��� ���� ���� write
                        if(data >=0){
                        door = data;
                        }else{
                        door = 0;
                        }
                        public int readDoor(){  //door ��� �������� read
                        return door;
                        }
                        
                       } 
                       
    >> Car c  = new Car();  c.writeDoor(10);  c.writeDoor(-1);   >>door >>0 
                                 int result = c.readDoor();
                                 
   >> private ���� �ϳ���>> �Լ�2��(read,write)
   >> java ������ Ư���� ������ �Լ� �� ����: setter(private �ڿ��� ���� write �������), getter (private �ڿ��� ���� read �б����)      
   >> �������� , �б�����
   >> private int age
   >> setter, getter ��� �����ص� �ǰ�(������ �ΰ� �� �����)
   >> setter �� �����ص� �ǰ�
   >> getter �� �����ص� �ȴ� > private int age = 100
   
                
    �츮�� ���� �ڿ��� ��ȣ�ϱ� ���� ���°ǵ� ������ ������, �߰��������ִ� ����� �Լ��� ���ִ���.    
    �ϳ��� ����ʵ尡 �����̺��ɶ� �ΰ��� �Լ��� ������. �д°� ���°�.              
 */
public class Ex04_Modifier {

	public static void main(String[] args) {
		Car c = new Car();
		/*
		c.writeSpeed(100);
		int result = c.readSpeed();
		System.out.println("����ӵ� : "+result);
        */
		c.setSpeed(-100);  //���������̶� ������ ��
		int result = c.getSpeed();  //�긦 �̿��ؼ� result�� ���� �־���.
		System.out.println("�ӵ� : "+ result);
		
		c.speedUp();
		c.speedUp();
		c.speedUp();
		result = c.getSpeed();
		System.out.println("�ӵ�:"+ result) ;
		
		c.speedDown();
		c.speedDown();
		c.speedDown();
		c.speedDown();
		result = c.getSpeed();
		System.out.println("�ӵ�:"+ result) ;
		
	}

}
