package HomeWork_Cinema.Team_5;

import java.util.Scanner;

public class Cinema {
	 private String[][] seat;
	    private Scanner sc;
	 
	    private String name;
	    
	    // default ������
	    public Cinema() {
	        this(3, 5);
	    }
	 
	    // �ó׸� ������ ���Ƿ� ����� ������
	    public Cinema(int num1, int num2) {
	        sc = new Scanner(System.in);
	        seat = new String[num1][num2];
	        for (int i = 0; i < seat.length; i++) {
	            for (int j = 0; j < seat[i].length; j++) {
	                seat[i][j] = (i + 1) + "-" + (j + 1);
	            }
	        }
	    }
	    
	    // 1. �¼� ��Ȳ
	    private void seatPrint() {
	        System.out.println("***********�¼� ��ġ��***********");
	        for (int i = 0; i < this.seat.length; i++) {
	            for (int j = 0; j < this.seat[i].length; j++) {
	                System.out.printf("[%s]",
	                        this.seat[i][j].equals((i + 1) + "-" + (j + 1)) ? (i + 1) + "-" + (j + 1) : "����");
	            }
	            System.out.println();
	        }
	        System.out.println("******************************");
	    }
	 
	    // 2. �����ϱ�
	    private void reserveSeat() {
	        int col, row;
	        for (int i = 0; i < seat.length; i++) {
	            for (int j = 0; j < seat[i].length; j++) {
	                System.out.printf("[%s]", seat[i][j].equals((i+1)+"-"+(j+1)) ? (i+1)+"-"+(j+1) : "����");
	            }
	            System.out.println();
	        }
	        do {
	            try {
	                System.out.print("���ϴ� ���� �����ϼ���: ");
	                col = Integer.parseInt(sc.nextLine());
	                System.out.print("���ϴ� ���� �����ϼ���: ");
	                row = Integer.parseInt(sc.nextLine());
	                System.out.print("�����ڸ�: ");
	                name = sc.next();
	                if (seat[col - 1][row - 1].equals(col + "-" + row)) {
	                    seat[col - 1][row - 1] = name;
	                    System.out.println(col + "��" + row + "�� �¼��� ����Ǿ����ϴ�");
	                    break;
	                } else {
	                    System.out.println("�̹� ����� �¼��Դϴ�.");
	                }
	            } catch (ArrayIndexOutOfBoundsException e) {
	                System.out.println("�ش� ��� ���� ��ȭ�� �¼��� �����ϴ�...�ٽ��Է��ϼ���");
	            } catch (Exception e) {
	                System.out.println("�߸��� ���� �ԷµǾ����ϴ�.... �ٽ� �Է��ϼ���");
	            }
	        } while (true);
	    }
	 
	    // 3. ���� ���� ��ȸ
	    private void showMySeat() {    
	        for (int i = 0; i < seat.length; i++) {
	            System.out.print((i + 1) + "��\t");
	            for (int j = 0; j < seat[i].length; j++) {
	                System.out.print(seat[i][j]+"\t");
	            }
	            System.out.println();
	        } 
	        System.out.println();    
	    }
	 
	    private int col, row;    
	 
	    private void cancelSeat() {
	        int name_count;
	        name = null; // ������ �̸�
	        System.out.print("������ �̸��� �Է��� �ּ���: ");
	        name = sc.next();
	        name_count = division_name(name);
	        if (name_count > 1) {
	            System.out.println("���������� �ֽ��ϴ�....");
	            System.out.println("�¼� ��ġ���� �����ݴϴ� ... ����� �¼��� �Է��ϼ��� >> ");
	            seatPrint();
	            System.out.print("���� �����ϼ���:");
	            col = sc.nextInt();
	            System.out.print("���� �����ϼ���:");
	            row = sc.nextInt();
	            seat[col - 1][row - 1] = col + "-" + row;
	            System.out.println("�¼� ������ ��ҵǾ����ϴ�");
	        } else if (name_count == 1) {
	            for (int i = 0; i < seat.length; i++) {
	                for (int j = 0; j < seat[i].length; j++) {
	                    if (seat[i][j].equals(name)) {
	                        seat[i][j] = (i + 1) + "-" + (j + 1);
	                        System.out.println((i + 1) + "�� " + (j + 1) + "�� " + "�¼� ������ ��ҵǾ����ϴ�");
	                    }
	                }
	            }
	        } else {
	            System.out.println("����� �̸��� �����ϴ�...");
	        }
	    }
	 
	    // �������� ���� �޼ҵ�
	    private int division_name(String name) {
	        int count = 0;
	        for (int i = 0; i < seat.length; i++) {
	            for (int j = 0; j < seat[i].length; j++) {
	                if (this.seat[i][j].equals(name)) {
	                    count++;
	                }
	            }
	        }
	        return count;
	    }
	    
	 
	    // ���ο��� �� �Լ�
	    public void showMenu() {
	        while (true) {
	            Scanner sc = new Scanner(System.in);
	            System.out.println("===��ȭ ���� ���α׷�===");
	            System.out.println("1.�¼� ��Ȳ");
	            System.out.println("2.�����ϱ�");
	            System.out.println("3.���� ���� ��ȸ");
	            System.out.println("4.���� ���� ���");
	            System.out.println("5.���α׷� ����");
	            System.out.println("===================");
	            System.out.print("1~5�� �ϳ��� �Է��ϼ���:");
	            String selectnum = sc.nextLine();
	            loop: while (true) {
	                switch (selectnum) {
	                case "1":
	                    seatPrint();                    
	                    break loop;
	                case "2":
	                    reserveSeat();
	                    break loop;
	                case "3":
	                    showMySeat();
	                    break loop;
	                case "4":
	                    cancelSeat();                    
	                    break loop;
	                case "5":
	                    System.out.println("�̿����ּż� �����մϴ�. <���α׷� ����>");
	                    return;
	                default:
	                    System.out.println("1~5 �� �ϳ��� �Է��ϼ���");
	                    break loop;
	                }
	            }
	        }

	    }
   }
