package Abstract_Factory.Ex4;

public class CpuIntel implements CPU {
	@Override
	public void CpuCreate() {
		System.out.println("인텔 CPU 생성");
	}
}