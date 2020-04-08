
public class PC extends Computer{//서브 클래스  : 생성할 객체를 기술하는 책임을 지정한다.
	
	private String ram;
	private String hdd;
	private String cpu;
	
	public PC(String ram, String hdd, String cpu) {
		this.ram = ram;
		this.cpu = cpu;
		this.hdd = hdd;
	}


	@Override
	public String getRAM() {
		// TODO Auto-generated method stub
		return this.ram;
	}

	@Override
	public String getHDD() {
		// TODO Auto-generated method stub
		return this.hdd;
	}

	@Override
	public String getCPU() {
		// TODO Auto-generated method stub
		return this.cpu;
	}

}
