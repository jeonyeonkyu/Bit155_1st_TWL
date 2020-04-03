package HomeWork_Cinema.Team_4;

import java.util.Scanner;

public class Cinema {
	private Scanner scanner;
    private String[][] seat;
    private int row; // �¼� ��
    private int col; // �¼� ��
    private String name; // ������ �̸�
 
    Cinema() { // ������ default
        this(3, 5);
    }
 
    Cinema(int row, int col) { // ��� ���� �Ķ���ͷ� ������ �ִ� ������
        scanner = new Scanner(System.in);
        seat = new String[row][col];
        for (int i = 0; i < seat.length; i++) {
            for (int j = 0; j < seat[i].length; j++) {
                seat[i][j] = "___";
            }
        }
    }
 
    void cinemaSeatSelect() { // �޴� �������� ���� ���� �̿��� ������ �޼ҵ�� ����
        loop_1: while (true) {
            String menunumber = cinemaMenu();
            switch (menunumber) {
            case "1":
                reservation();
                System.out.println();
                break;
            case "2":
                reservationCancel();
                System.out.println();
                break;
            case "3":
                reservationCheck();
                System.out.println();
                break;
            case "4":
                System.out.println("�ȳ��� ������.");
                break loop_1;
            default:
                System.out.println("�߸� �Է��ϼ̽��ϴ�.");
                System.out.println("�޴��� 1~4������ �Դϴ�.");
                System.out.println();
                break;
            }
        }
    }
 
    String cinemaMenu() { // �޴� ȭ��
        System.out.println("****��Ʈ ��ȭ��****");
        System.out.println("1. ��ȭ ����");
        System.out.println("2. ���� ���");
        System.out.println("3. ���� ��ȸ");
        System.out.println("4. ������");
        System.out.println("****************");
        String menunumber = scanner.nextLine();
        return menunumber;
    }
 
    void seatCheckNow() { // �¼� �����ְ� ���ϴ� �¼� �� ������ �̸� �Է�
        for (int i = 0; i < seat.length; i++) {
            for (int j = 0; j < seat[i].length; j++) {
                System.out.printf("[%s]", seat[i][j].equals("___") ? "�ڸ�" : "����");
            }
            System.out.println();
        }
        do {
            try {
                System.out.println("���Ͻô� �ڸ��� �������ּ���.");
      System.out.println("���� �Է����ּ���.");
                row = Integer.parseInt(scanner.nextLine());
      System.out.println("���� �Է����ּ���.");  
                col = Integer.parseInt(scanner.nextLine());
                if (row - 1 < seat.length && col - 1 < seat[0].length && (row & col) > 0) {
                    System.out.println("������ ������ �Է����ּ���.");
                    String name = scanner.nextLine();
                    this.name = name;
                    return;
                } else {
                    throw new Exception("��� ���� ������ ������ϴ�.");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                continue;
            }
        } while (true);
    }
 
    void reservation() { // ����
        seatCheckNow();
        if (seat[row - 1][col - 1].equals("___")) {
            System.out.println("����Ǿ����ϴ�.");
            seat[row - 1][col - 1] = name;
        } else {
            System.out.println("�̹� ����Ǿ����ϴ�.");
        }
 
    }
 
    void reservationCheck() { // ���� ��ȸ
        seatCheckNow();
        if (seat[row - 1][col - 1].equals(name)) {
            System.out.printf("[%s]���� �ڸ� : [%d]��, [%d]��\n", seat[row - 1][col - 1], row, col);
        } else {
            System.out.printf("[%d]��, [%d]���� [%s]���� �������� �� ������ �����ϴ�.\n", row, col, name);
        }
    }
 
    void reservationCancel() { // ���� ���
        seatCheckNow();
        if (seat[row - 1][col - 1].equals(name)) {
            System.out.println("������ ��ҵǾ����ϴ�.");
            seat[row - 1][col - 1] = "___";
        } else {
            System.out.printf("[%d]��, [%d]���� [%s]���� �������� �� ������ �����ϴ�.\n", row, col, name);
        }
    }
}
 

 