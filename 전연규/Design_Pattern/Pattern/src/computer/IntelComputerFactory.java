package computer;

public class IntelComputerFactory implements ComputerFactory {
    public IntelCpu createCpu() {
        return new IntelCpu();
    }

    public IntelGraphic createGraphic() {
        return new IntelGraphic();
    }

}