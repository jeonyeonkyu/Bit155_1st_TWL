package Ex10_Thread.Quiz;

import java.util.ArrayList;

public class RacingGame extends Thread {

	String name;
	int distance;
	public static ArrayList list = new ArrayList();

	public RacingGame(String name) {
		this.name = name;
	} // ������

	public void run() {
		int boxNum = 0;
		String Mark = "";

		while (true) {
			try {
				if (distance > 30) {
					System.out.println(name + "���");
					list.add(name);
					break;
				}

				Thread.sleep(300);
				distance += (int) (Math.random() * 3) + 1;
				boxNum = distance / 5;
				for (int i = 0; i < boxNum; i++) {
					Mark += "��";
				}
				System.out.println(name + " " + Mark);
			}

			catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		RacingGame R1 = new RacingGame("1��ة");
		RacingGame R2 = new RacingGame("2��ة");
		RacingGame R3 = new RacingGame("3��ة");
		RacingGame R4 = new RacingGame("4��ة");
		RacingGame R5 = new RacingGame("5��ة");
		RacingGame R6 = new RacingGame("6��ة");

		Thread th1 = new Thread(R1);
		Thread th2 = new Thread(R2);
		Thread th3 = new Thread(R3);
		Thread th4 = new Thread(R4);
		Thread th5 = new Thread(R5);
		Thread th6 = new Thread(R6);

		th1.start();
		th2.start();
		th3.start();
		th4.start();
		th5.start();
		th6.start();

		try {
			th1.join();
			th2.join();
			th3.join();
			th4.join();
			th5.join();
			th6.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println();
		System.out.println();
		for (int i = 0; i < list.size(); i++) {
			System.out.println("�������� / " + (i + 1) + "�� : " + list.get(i));
		}

	}
}
