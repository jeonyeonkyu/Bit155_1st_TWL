package Abstract_Factory.Ex3;

public class RyzenVga extends Vga{
	 
    private String vgaName;
     
    public RyzenVga(String vgaName){
        this.vgaName=vgaName;
    }
    @Override
    public String getVga() {
        return this.vgaName;
    }

}
