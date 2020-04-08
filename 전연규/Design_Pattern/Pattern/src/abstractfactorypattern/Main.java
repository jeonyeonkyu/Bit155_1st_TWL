package abstractfactorypattern;

public class Main {
    public static void main(String[] args) {
        Product com = ProductFactory.getProduct(new ComputerFactory("com1", 2000));
        Product tk = ProductFactory.getProduct(new TicketFactory("°ø¿¬", 100000));
        System.out.println( com.toString() );
        System.out.println( tk.toString() );
    }
}

//https://blog.seotory.com/post/2016/08/java-abstract-factory-pattern