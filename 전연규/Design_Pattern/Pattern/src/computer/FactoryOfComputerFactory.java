package computer;

public class FactoryOfComputerFactory {
    public void createComputer(String type){
        ComputerFactory computerFactory= null;
        switch (type){
            case "Intel":
                computerFactory = new IntelComputerFactory();
                break;

            case "Ryzen":
                computerFactory = new RyzenComputerFactory();
                break;
        }

        computerFactory.createCpu();
        computerFactory.createGraphic();
    }
}