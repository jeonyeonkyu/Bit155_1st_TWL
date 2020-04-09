package Abstract_Factory.Ex3;

public class IntelVga extends Vga{
	 
    private String vgaName;
     
    public IntelVga(String vgaName){
        this.vgaName=vgaName;
    }
    @Override
    public String getVga() {
        return this.vgaName;
    }

}
