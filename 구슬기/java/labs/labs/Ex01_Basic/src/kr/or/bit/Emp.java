package kr.or.bit;

//����̶�� ���赵
//����� ������ ��� ����� ����ϴ� �Լ��� ������ ����
//class 155th {}

public class Emp {
    public int empno; 
    //������ ��� ����, ����� ����� ������ �ִ�(��� : ���� ������)
    
    public String ename; //�̸�
    public String job;//����

    //���� > ����(������) �� ���� �� �ִ� > ��ȭ(��) > instance variable(��ü����) -> member field   
    private int data;
    //ĸ��ȭ : �ڿ��� ��ȣ�ϰڴ�
    //�����Ҵ��� ���� �����Ҵ��� ���ؼ� ������ ��ȣ

    //���, ��������>�Լ�>method
    public int getData() { //getter
    	return data; //data �ϴ� member field �� ������ ���� �����ٰž�
    
    }
    	
    //��� >method > write
    public void setData(int input) { //setter
    	if(input < 0) {
    		data = 0;
    	}else {
    		data = input;
    	}
    	
    }
    
    //ĸ��ȭ�� �ڿ��� ���ؼ� read, write (getter, setter) �Լ��� �����Ѵ�.
    
    //����ϴ� ���(���� ����>�Լ�>method)
    //�Լ��� �ݵ�� ȣ�⿡ ���ؼ��� ����...
    public void getEmpInfo() {
    	System.out.println(empno + "/" + ename + "/" + job);
    }
}

    
    
    