//���� : Thread (����)
//Main Thread �� ������ ���� �ϰڴ�
//�ѱ� >> �۾� >> 3�ʰ������� �۾����� ���� 
//�ѱ� �۾� ���� >> 3�ʰ������� �۾� ���� ���� 
public class Ex08_Damon_Thread implements Runnable {
	static boolean autosave = false;
	public static void main(String[] args) {
		Thread th = new Thread(new Ex08_Damon_Thread()); 
		//th ���  �������   main �������� ���� (Damon)
		//main �ϳ���  ������ (non-damon)
		//main �Լ��� ������� ����� ���� �ϰڴ� (���� : th)
		th.setDaemon(true);
		th.start();
		
		for(int i = 0 ; i <= 30 ; i++) {
			try {
				Thread.sleep(1000); //1��
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			System.out.println("Main Thread ���� : " + i);
			if(i == 5) { //i���� 5�� ��������
				System.out.println("i : " + i);
				autosave = true;
			}
		}

	}
    public void autoSave() {
    	System.out.println("���ڰ� 3�� �������� �ڵ� ���� �Ǿ����ϴ�");
    }
	
	@Override
	public void run() {
		while(true) {
			try {
				Thread.sleep(3000); //3�� ����
			}catch (Exception e) {
				
			}
			if(autosave) {  //static boolean autosave   true ���̶�� ...
				autoSave();
			}
		}
		
	}

}





