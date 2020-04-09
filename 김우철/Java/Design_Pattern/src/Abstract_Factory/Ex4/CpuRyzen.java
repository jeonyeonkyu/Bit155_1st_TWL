package Abstract_Factory.Ex4;

public class CpuRyzen implements CPU {
	@Override
	public void CpuCreate() {
		System.out.println("라이젠 CPU 생성");
	}
}