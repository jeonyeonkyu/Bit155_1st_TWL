package Abstract_Factory.Ex3;

public class IntelCpu extends Cpu {
	 
    private String cpuName;
     
    public IntelCpu(String cpuName){
        this.cpuName=cpuName;
    }
    @Override
    public String getCpu() {
        return this.cpuName;
    }

 
}