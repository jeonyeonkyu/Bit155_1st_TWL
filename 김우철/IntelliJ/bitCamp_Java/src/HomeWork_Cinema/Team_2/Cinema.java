package HomeWork_Cinema.Team_2;

import java.util.Scanner;

public class Cinema {
	    private Scanner sc = new Scanner(System.in);
	    private final int ROW = 3;
	    private final int COL = 5;
	    private String[][] seat = new String[ROW][COL];
	    
	    public void menu() {
	        //�¼� �����
	        for (int i = 0; i < seat.length; i++) {
	            for (int j = 0; j < seat[i].length; j++) {
	                seat[i][j] = "___";
	            }
	        }
	        while(true) {
	            System.out.println("*************");
	            System.out.println("1. �¼� ���� ����");
	            System.out.println("2. �� �� ��  �� ȸ");
	            System.out.println("3. �� ��     �� ��");
	            System.out.println("4. �� ��     �� ��");
	            System.out.println("5. �� ��     �� ��");
	            System.out.println("0. ��            ��");
	            System.out.println("*************");
	            System.out.print("������ �޴���ȣ�� �Է��ϼ���: ");
	            int menuNum = Integer.parseInt(sc.nextLine());
	            switch(menuNum) {
	                case 1: seatInfo(); break; //�¼� ��������
	                case 2: mySeat(); break; //�¼� ��ȸ
	                case 3: selectSeat(); break; //�¼� ����
	                case 4: updateSeat(); break; //�¼� ����
	                case 5: deleteSeat(); break; //�¼� ���
	                case 0: System.exit(0); break;
	                default: System.out.println("�߸� �Է��ϼ̽��ϴ�.");
	            }
	        }
	    }
	    
	    //�ڸ� ��ȸ
	    public void mySeat() {
	        String name;
	        
	        while(true) {
	            System.out.print("��ȸ�� ������ ������ �Է��ϼ���: ");
	            name = sc.nextLine();
	            
	            for (int i = 0; i < seat.length; i++) {
	                for (int j = 0; j < seat[i].length; j++) {
	                    if(seat[i][j].equals(name)) {
	                        System.out.println(name + "�� ���� �¼��� (" + (i+1) + "," + (j+1) + ") �Դϴ�.");
	                        return;
	                    }
	                }
	            }
	            //�̸� �߸� �Է½� ó���ϴ� �Լ�
	            if(wrongName() == 0) {
	                return;
	            }
	        } 
	    }
	    
	    //�¼� ����
	    public void updateSeat() {
	        int row, col;
	        String name;
	        
	        outer:
	        while(true) {
	            System.out.print("������ ������ ������ �Է��ϼ���: ");
	            name = sc.nextLine();
	            
	            for (int i = 0; i < seat.length; i++) {
	                for (int j = 0; j < seat[i].length; j++) {
	                    if(seat[i][j].equals(name)) {
	                        break outer;
	                    }
	                }
	            }
	            //�̸� �߸� �Է½� ó���ϴ� �Լ�
	            if(wrongName() == 0) {
	                return;
	            }
	            
	        } 
	        
	        do {
	            try {
	                System.out.print("������ �¼� ��ġ�� �Է��ϼ���(ex:2,1): ");
	                String inputSeat = sc.nextLine();
	                String[] seatArr = inputSeat.trim().replace(" ", "").split(",");
	                
	                row = Integer.parseInt(seatArr[0])-1;
	                col = Integer.parseInt(seatArr[1])-1;
	                if(row > ROW || col > COL) {
	                    throw new Exception("�¼��� �߸� �Է��ϼ̽��ϴ�.");
	                } else {
	                    break;
	                }
	            } catch (Exception e) {
	                e.getMessage();
	                System.out.println("(1,1)���� (3,5)���� �ڸ������� �����մϴ�.");
	            }
	        } while(true);
	        
	        outer2:
	        if (!seat[row][col].equals("___")) {
	            System.out.println("�̹� ����� �ڸ��Դϴ�");
	        } else {
	            for (int i = 0; i < seat.length; i++) {
	                for (int j = 0; j < seat[i].length; j++) {
	                    if(seat[i][j].equals(name)) {
	                        seat[i][j] = "___";
	                        seat[row][col] = name;
	                        System.out.println(name + "���� �����Ͻ� �¼��� �����Ǿ����ϴ�.");
	                        break outer2;
	                    }
	                }
	            }
	        }
	        //�¼� ���� �����ֱ�
	        seatInfo();
	    }
	    
	    //�¼� ���
	    public void deleteSeat() {
	        outer:
	        while(true) {
	            System.out.print("����� ������ ������ �Է��ϼ���: ");
	            String name = sc.nextLine();
	            
	            for (int i = 0; i < seat.length; i++) {
	                for (int j = 0; j < seat[i].length; j++) {
	                    if(seat[i][j].equals(name)) {
	                        seat[i][j] = "___";
	                        System.out.println(name + "���� �����Ͻ� �¼��� ��ҵǾ����ϴ�.");
	                        break outer;
	                    }
	                }
	            }
	            //�̸� �߸� �Է½� ó���ϴ� �Լ�
	            if(wrongName() == 0) {
	                return;
	            }
	        }
	        
	        //�¼� ���� �����ֱ�
	        seatInfo();
	    }
	    
	    //�¼� ����
	    public void selectSeat() {
	        int row, col;
	        String name;
	        
	        System.out.print("������ ������ �Է��ϼ���: ");
	        name = sc.nextLine();
	            
	        do {
	            try {
	                System.out.print("������ �¼� ��ġ�� �Է��ϼ���(ex:2,1): ");
	                String inputSeat = sc.nextLine();
	                String[] seatArr = inputSeat.trim().replace(" ", "").split(",");
	                
	                row = Integer.parseInt(seatArr[0])-1;
	                col = Integer.parseInt(seatArr[1])-1;
	                
	                if(row > ROW || col > COL) {
	                    throw new Exception(); //�迭�� ��� �ڸ�
	                }
	                if(seat[row][col].equals("___")) {
	                    seat[row][col] = name;
	                    System.out.println("���Ű� �Ϸ�Ǿ����ϴ�.");
	                    break;
	                } else {
	                    throw new Exception(); //�̹� ���� �� �ڸ�
	                }
	            } catch (Exception e) {
	                System.out.println("�̹� ���� �� �ڸ��̰ų� �߸� �Է��ϼ̽��ϴ�.");
	                System.out.println("(1,1)���� (3,5)���� �ڸ������� �����մϴ�.");
	            }
	        } while(true);
	        
	        //�¼� ���� �����ֱ�
	        seatInfo();
	    }
	    
	    //�̸� �߸��Է½� ó���ϴ� �Լ�
	    private int wrongName() {
	        int inputNum = -1;
	        System.out.println("�Է��Ͻ� �̸����� ����� �¼��� �����ϴ�.");
	        System.out.print("�̸��� �ٽ� �Է��Ͻ÷��� 0�� ������ �ƹ� ���ڸ� �Է��ϼ���.  0.�ڷΰ��� : ");
	        inputNum = Integer.parseInt(sc.nextLine());
	        return inputNum;
	    }
	    
	    //�¼� ���� �����ֱ�
	    public void seatInfo() {
	        for (int i = 0; i < seat.length; i++) {
	            for (int j = 0; j < seat[i].length; j++) {
	                System.out.printf("[%s]", seat[i][j].equals("___") ? "�ڸ�" : "����");
	            }
	            System.out.println();
	        }
	    }
	    
	    public static void main(String[] args) {
	        Cinema cinema = new Cinema();
	        cinema.menu();
	    }
}
