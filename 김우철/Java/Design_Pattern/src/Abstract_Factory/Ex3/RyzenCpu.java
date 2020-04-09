package Abstract_Factory.Ex3;

public class RyzenCpu extends Cpu {
	 
    private String cpuName;
     
    public RyzenCpu(String cpuName){
        this.cpuName=cpuName;
    }
    @Override
    public String getCpu() {
        return this.cpuName;
    }

 
}