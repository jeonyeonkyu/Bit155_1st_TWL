package kr.or.bit;

import java.util.Random;
import java.util.Scanner;

/*   
 *1. 1~45������ ������ �߻����� 6���� �迭�� ��������
      (int)(Math.random()*45 + 1)
      lotto[0] = 44 , lotto[1] = 1 .... lotto[5] = 33
 *2. �迭�� ��� 6���� �迭���� �ߺ����� ������ �ȵǿ�  (�ߺ��� ���� :����� ���)     ���
 *3. �迭�� �ִ� 6���� ���� ���� ������ ���� ��Ű����  (���� : �ڸ��ٲ�)             ���
 *4. �� ����� ��� �ִ� �迭�� ����ϼ��� (ȭ�� ���)                           ���

 ���Ŀ��� ������ Ŭ���� �и��ؼ� Lotto.java ..... 
 ���� main �Լ� �ȿ��� ��� ....����...

���� 1�� �Դϴ�
  
  
  Ÿ�� : 8���� +String + class + �迭(Array) :�迭�� �ϳ��� Ÿ����
  8���� �⺻Ÿ�� ���� �������� �� �ּҰ��� �޴´�.

 */
//���赵
//Ŭ������ ����ʵ�� �迭�̴� Ŭ�����̴� �ʱ�ȭ�� �����ڿ��� ����  !!! �ʿ��ϴٸ� �����ε�
public class Lotto {
	// public int[] numbers; //�ٸ� ��Ű������ ����Ϸ��ϴϱ� public ��ȣ�Ϸ��� ĸ��ȭ
	// public int[] numbers = new int[6]; Ʋ���ڵ� �Ƴ鿩
//	private int numbers; //���⿡�� �ʱ�ȭ�ϴ� �ͺ��� 25��ó�� �ϴ°� ���ƺ���
//	
//	public Lotto() { //������, ������ ����ʵ� �ʱ�ȭ
//		this(10); //this�����ڸ� ���� �� �̻ڴ�..    //��ü�� �����ϸ� 10�� �ڵ����� ����.
//	}
//	public Lotto(int numbers) {               // ��ü�� ���鶧���� ���ڸ� �Է��Ҽ��ִ�.
//		this.numbers=numbers;
//	}

	private int[] numbers; // �ʱ�ȭ�� �����ڿ��� �ϴ°� ����.
	private Scanner scanner; // =new Scanner(System.in);
	private Random r; // = new Random();

	public Lotto() {
		// �ʱ�ȭ(member field)
		numbers = new int[6];
		scanner = new Scanner(System.in);
		r = new Random();
	}
	// ���....(method)�ȿ��� >>�Լ� �ϳ��� ��� �Ѱ���
	// ���� ��ȣ �������ּ���.
	// �ߺ����� ������ �ȵǿ�
	// ���� ������ ���� ��Ű����
	// ����ϼ��� (ȭ�����)
	// �޴� ���.....����...
	// 1>> �ζ� ����
	// 2>> ���α׷� ����

	public void selectLottoNumber() {
		loop_1: while (true) {
			String selectionnum = showMenu(scanner);
			switch (selectionnum) {
			case "1":
//			makeLottoNumber(r,numbers); //�̷��� ���ص� ������, �����ϱ����� �Ķ���� �� ä���. r�� �ּҰ� numbers�� �迭�� �ּҰ�     //�ǹ�ȣ����
//			showLottoNumbers(); //���� �ϰ� ����ϱ�
				do {
					makeLottoNumber(r, numbers);
				} while (!checkAverage());
				showLottoNumbers();
				checkNum();
				break;
			case "2": // ���α׷� ���� : return (�Լ� Ż��), System.exit(0), �� ��
				System.out.println("Good Lucky^^");
				break loop_1; // break �ϰԵǸ� �� �ȾƳ��� ���������� �ٽ� ����. ������ ����ġ Ż���ϴ� �극��ũ�ϸ� ���Ϲ��� ������. ������ Ư���� ������.(��
								// �̸��� �������)
			default:
				System.out.println("Not in Operation~~");
				break;
			}
		}
	}

	// private ���� �� �������� �ǵ��� �����ϱ�?
	// ���ο����� ����ϰڴ�.����а��� �ۿ��� �ۺ�.
	private String showMenu(Scanner sc) { // �����̴ϱ� (parameter)�����Ұ���
		System.out.println("******************");
		System.out.println("*1. ��÷���� ��ȣ ȣ��*");
		System.out.println("*2. ���α׷� ���� ^^!*");
		System.out.println("******************");
		System.out.println("���ϴ� �۾� ��ȣ�� �Է��ϼ���:");
		String selectionnum = sc.nextLine();
		return selectionnum;
	}

	// ��ȣ����, �ߺ��� ����
	private void makeLottoNumber(Random r, int[] numbers) { // parameter����
		for (int i = 0; i < 6; i++) {
			numbers[i] = r.nextInt(45) + 1;// (int) (Math.random() * 45 + 1); �꺸�� ���ϴ�.
			for (int j = 0; j < i; j++) { // j < i (ä���� ���� ��ŭ ��)
				if (numbers[i] == numbers[j]) {
					i--; // point ���� ���� ���� �ٲپ �Ѵ�
					break;
				}
			}
		}
	}

	// ȭ�鿡 ����ϴ� ��� �ϳ�����
	private void showLottoNumbers() {
		System.out.println("[������ Lotto ��ȣ]");

		for (int i = 0; i < numbers.length; i++) {
			for (int j = i + 1; j < numbers.length; j++) {
				if (numbers[i] > numbers[j]) {
					int temp = numbers[i];
					numbers[i] = numbers[j];
					numbers[j] = temp;
				}
			}
		}
		for (int i = 0; i < numbers.length; i++) {
			System.out.printf("[%2d]",numbers[i]);
		}
		System.out.println();

	}

	// ��Ģ�� �߰��ߴ�! (�迭�� ���� ����� Ư�� �������� ����� ������)
	private boolean checkAverage() {
		int sum = 0;
		int average = 0;
		for (int num : numbers) {
			sum += num;
		}
		average = sum / numbers.length;
		System.out.println("��� : " + average);
		return (average >= 15 && average <= 35); // true , false �� ��������. �������ϴ� ����� ������ �ƴϸ� �ٽ� �̰� �ϰ�ʹ�. �װ� ����ġ��������.
	}
	
	//Ȧ�� ¦�� ������
	private void checkNum() {
		System.out.print("¦�� : ");
        for (int i = 0; i < numbers.length; i++) {
            if(numbers[i]%2==0) {
                System.out.printf("[%2d]",numbers[i]);}
        }
        System.out.println();
        System.out.print(" Ȧ�� : ");
            for (int i = 0; i < numbers.length; i++) {      
            if(numbers[i]%2!=0){
                System.out.printf("[%2d]",numbers[i]);}
        }
        System.out.println();
	}

}
