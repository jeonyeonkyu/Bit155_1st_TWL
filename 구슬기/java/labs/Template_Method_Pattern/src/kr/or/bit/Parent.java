package kr.or.bit;

public class Parent {
	// �ڽĿ��� ���������� ����ϴ� �κ�( someMethod )�� ���ø� �޼���� �Ѵ�.
    public void someMethod(){
        System.out.println("�θ𿡼� ����Ǵ� �κ� - ��");

        // �ڽĿ��� �����ؾ� �� �κ��� �� �޼���� �Ѵ�.
        hook();

        System.out.println("�θ𿡼� ����Ǵ� �κ� - ��");
    }

    public void hook(){};
}
