package computer;

public class Client {
    public static void main(String args[]){
    	System.out.println("인텔 컴퓨터 생성");
        FactoryOfComputerFactory factoryOfComputerFactory = new FactoryOfComputerFactory();
        factoryOfComputerFactory.createComputer("Intel");
        System.out.println("----------------------------------------------");
    	System.out.println("라이젠 컴퓨터 생성");
        FactoryOfComputerFactory factoryOfComputerFactory2 = new FactoryOfComputerFactory();
        factoryOfComputerFactory2.createComputer("Ryzen");
    }
}