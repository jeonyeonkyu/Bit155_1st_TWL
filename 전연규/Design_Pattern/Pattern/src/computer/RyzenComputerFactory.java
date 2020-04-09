package computer;

public class RyzenComputerFactory implements ComputerFactory {
    public RyzenCpu createCpu() {
        return new RyzenCpu();
    }

    public RyzenGrapic createGraphic() {
        return new RyzenGrapic();
    }

}