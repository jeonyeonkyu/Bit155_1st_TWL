package computer;

public class Client {
    public static void main(String args[]){
    	System.out.println("���� ��ǻ�� ����");
        FactoryOfComputerFactory factoryOfComputerFactory = new FactoryOfComputerFactory();
        factoryOfComputerFactory.createComputer("Intel");
        System.out.println("----------------------------------------------");
    	System.out.println("������ ��ǻ�� ����");
        FactoryOfComputerFactory factoryOfComputerFactory2 = new FactoryOfComputerFactory();
        factoryOfComputerFactory2.createComputer("Ryzen");
    }
}