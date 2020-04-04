package kr.or.bit;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

public class Customer {

	Scanner scanner = new Scanner(System.in);

	private String customId;
	private String customPwd; // int > String ����
	private ArrayList<Reservation> reservation; // ���� - �ȵǸ� �Լ���..... public List<Reservation> reservation(){return
												// null};
	int row, col; // �¼��� ������
	String showDate; // ��¥����

	public Customer() {

	}

	public Customer(String customId, String customPwd) {
		this.customId = customId;
		this.customPwd = customPwd;
	}// Customer End

	public void reserve(Admin admin) { // �����Լ�(AdminŸ������ �Ķ���͸�����)

		// Reservation reservation = new Reservation();

		Loop: while (true) {

			System.out.println("� ������ �����ұ��?");
			System.out.println("1.�߷�");
			System.out.println("2.����ȸ");
			System.out.println("3.�����");
			System.out.println("0.�ڷΰ���");
			System.out.print("���ϴ� �޴� ��ȣ�� �Է��ϼ���>> ");

			String selection = scanner.nextLine().trim();
			switch (selection) {

			case "1": // �߷� ����

				System.out.println("��¥�� �����ϼ���:(4.1)(4.4) ");
				showDate = scanner.nextLine().trim();

				if (showDate.equals("4.1")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 �� ���ϴ� ��: "); // �� �Է�
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 �� ���ϴ� ��: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // ���Է�

								// �����Ϸ��� �¼��� ��������� �ش��¼��� �ڸ������ٰ� ǥ����
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "�ڸ�����";
									System.out.printf("[%d]�� [%d]�� ���࿡ �����ϼ̽��ϴ�\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("�̹� ���� �Ǿ����ϴ�. �ٽ� ������ �ּ���");
								}
							}
						}
					} // for�� ��

					// 4.1 �Է½� for���� ���Ҵµ� 4.1�� �߷������� ������ �޼��� ���
					System.out.println("4.1 �߷������� ���� ������ �ȵǾ����ϴ�..");
				} // if������ ������

				else if (showDate.equals("4.4")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 �� ���ϴ� ��: "); // �� �Է�
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 �� ���ϴ� ��: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // ���Է�

								// �����Ϸ��� �¼��� ��������� �ش��¼��� �ڸ������ٰ� ǥ����
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "�ڸ�����";
									System.out.printf("[%d]�� [%d]�� ���࿡ �����ϼ̽��ϴ�\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("�̹� ���� �Ǿ����ϴ�. �ٽ� ������ �ּ���");
								}
							}
						}
					} // for�� ��

					// 4.2 �Է½� for���� ���Ҵµ� 4.2�� �߷������� ������ �޼��� ���
					System.out.println("4.4  �߷������� ���� ������ �ȵǾ����ϴ�..");
				} // if ���� ������

				else {
					System.out.println("��¥�� ����� �Է����ּ���...");
				}

//				System.out.println("��¥�� �����ϼ���: ");
//				//��¥ ���� ���� �� �ڸ� 4.2
//				System.out.println("===========�¼���Ȳǥ===========");
//				//admin.showselection.showList.get(0).getSeat();
//				//���� index
//				System.out.println("�¼�����:");
//				
//				
//				
//				int a = (int)(Math.random()*100000)+900000;
//				reservation.add(new Reservation(customId,"23",20000,a));
//				//reservation.get(0).setNum(a);
//				//���⼭ index ���...?
//				
//				System.out.println("�������� ���:"+reservation.get(0).toString());		
//				System.out.println("���Ű� �Ϸ�Ǿ����ϴ�. [���Ź�ȣ: ");

//				int a = reservation.getPrice();
//				int b = admin.getTotalBalance();
//				System.out.println(b += a);
//				

				break;

			case "2": // ����ȸ �������ý�
				System.out.println("��¥�� �����ϼ���:(4.2)(4.6)");
				showDate = scanner.nextLine().trim();

				if (showDate.equals("4.2")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 �� ���ϴ� ��: "); // �� �Է�
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 �� ���ϴ� ��: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // ���Է�

								// �����Ϸ��� �¼��� ��������� �ش��¼��� �ڸ������ٰ� ǥ����
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "�ڸ�����";
									System.out.printf("[%d]�� [%d]�� ���࿡ �����ϼ̽��ϴ�\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("�̹� ���� �Ǿ����ϴ�. �ٽ� ������ �ּ���");
								}
							}
						}
					} // for�� ��

					System.out.println("4.2 ����ȸ������ ���� ������ �ȵǾ����ϴ�..");
				} // if������ ������

				else if (showDate.equals("4.6")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 �� ���ϴ� ��: "); // �� �Է�
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 �� ���ϴ� ��: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // ���Է�

								// �����Ϸ��� �¼��� ��������� �ش��¼��� �ڸ������ٰ� ǥ����
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "�ڸ�����";
									System.out.printf("[%d]�� [%d]�� ���࿡ �����ϼ̽��ϴ�\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("�̹� ���� �Ǿ����ϴ�. �ٽ� ������ �ּ���");
								}
							}
						}
					} // for�� ��

					System.out.println("4.6 ����ȸ������ ���� ������ �ȵǾ����ϴ�..");
				} // if ���� ������

				else {
					System.out.println("��¥�� ����� �Է����ּ���...");
				}
				break;
			case "3": // ����� ���� ���ý�
				System.out.println("��¥�� �����ϼ���:(4.3)(4.5)(4.7) ");
				showDate = scanner.nextLine().trim();

				if (showDate.equals("4.3")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 �� ���ϴ� ��: "); // �� �Է�
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 �� ���ϴ� ��: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // ���Է�

								// �����Ϸ��� �¼��� ��������� �ش��¼��� �ڸ������ٰ� ǥ����
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "�ڸ�����";
									System.out.printf("[%d]�� [%d]�� ���࿡ �����ϼ̽��ϴ�\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("�̹� ���� �Ǿ����ϴ�. �ٽ� ������ �ּ���");
								}
							}
						}
					} // for�� ��

					System.out.println("4.3 ���������� ���� ������ �ȵǾ����ϴ�..");
				} // if������ ������

				else if (showDate.equals("4.5")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 �� ���ϴ� ��: "); // �� �Է�
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 �� ���ϴ� ��: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // ���Է�

								// �����Ϸ��� �¼��� ��������� �ش��¼��� �ڸ������ٰ� ǥ����
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "�ڸ�����";
									System.out.printf("[%d]�� [%d]�� ���࿡ �����ϼ̽��ϴ�\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("�̹� ���� �Ǿ����ϴ�. �ٽ� ������ �ּ���");
								}
							}
						}
					} // for�� ��

					System.out.println("4.5 ���������� ���� ������ �ȵǾ����ϴ�..");
				} // if ���� ������

				else if (showDate.equals("4.7")) {
					for (int i = 0; i < admin.showselection.showList.size(); i++) {

						if (admin.showselection.showList.get(i).getShowDate().equals(showDate)) {
							while (true) {
								admin.showselection.showList.get(i).seatInfo();
								System.out.println("1~4 �� ���ϴ� ��: "); // �� �Է�
								row = Integer.parseInt(scanner.nextLine()) - 1;
								System.out.println("1~5 �� ���ϴ� ��: ");
								col = Integer.parseInt(scanner.nextLine()) - 1; // ���Է�

								// �����Ϸ��� �¼��� ��������� �ش��¼��� �ڸ������ٰ� ǥ����
								if (admin.showselection.showList.get(i).seat[row][col].equals("____")) {
									admin.showselection.showList.get(i).seat[row][col] = "�ڸ�����";
									System.out.printf("[%d]�� [%d]�� ���࿡ �����ϼ̽��ϴ�\n", row + 1, col + 1);
									break Loop;
								} else {
									System.out.println("�̹� ���� �Ǿ����ϴ�. �ٽ� ������ �ּ���");
								}
							}
						}
					} // for�� ��

					System.out.println("4.7 ���������� ���� ������ �ȵǾ����ϴ�..");
				} // if ���� ������

				else {
					System.out.println("��¥�� ����� �Է����ּ���...");
				}
				break;

			case "0": // showCustomerMenu(����� ���� �޴�)�� ���ư���
				break Loop;

			default:
				break;
			}
		}
	}

	public void checkReserve() { // ���� Ȯ��
		Loop1: for (int i = 0; i < reservation.size(); i++) {
			if (reservation.get(i).getCustomId().equals(customId)) {
				System.out.println("======���� ����======");
				System.out.printf("���Ź�ȣ \t �������� \t ��¥ �� �ð� \t �¼�");
				System.out.printf("%d \t %s \t %d \t %d", reservation.get(i).getNum(), reservation.get(i),
						reservation.get(i).getDate(), reservation.get(i));
			} else {
				System.out.println("���� ������ �����ϴ�.");
				break Loop1;
			}
		}
	}// checkReserve() End

	private void cancelReserve() { // ���� ���

	}// cancelReserve()End

	private void delCustom() {// ���� ����

	}// delCustom() End

	public String getCustomId() {
		return customId;
	}

	public String getCustomPwd() {
		return customPwd;
	}

	public ArrayList<Reservation> getReservation() {
		return reservation;
	}

}// Customer End
