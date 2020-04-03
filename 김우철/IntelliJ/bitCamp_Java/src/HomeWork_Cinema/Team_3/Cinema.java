package HomeWork_Cinema.Team_3;

import java.util.Scanner;

public class Cinema {
	 private static String[][] seatArr; // �¼� �迭. ������ �� �¼�����, ���ŵ� �ڸ��� �� "����"�� �Էµ�
	    private static int[][] reservationNumberArr; // ���Ź�ȣ �迭. �ش� �ڸ��� ���Ű� �Ǹ� ���Ź�ȣ�� �Էµ�
	    private String reservationNumber; // ���Ź�ȣ ����
	 
	    public Scanner sc;
	 
	    public Cinema() {  //�⺻ ������ 3�� 5�� ��ȭ�� ����
	        this(3, 5);
	    }
	 
	    public Cinema(int row, int col) {    // ��� ���� �Ű������� ���� ������
	        seatArr = new String[row][col];
	        reservationNumberArr = new int[row][col];
	        sc = new Scanner(System.in);
	 
	        // �¼��� ���Ź�ȣ �ʱ�ȭ
	        for (int i = 0; i < seatArr.length; i++) {
	            for (int j = 0; j < seatArr[i].length; j++) {
	                seatArr[i][j] = (i + 1) + "-" + (j + 1);
	                reservationNumberArr[i][j] = 0;
	            }
	        }
	    }
	    // �ʱ� �޴�
	 
	    int displayMenu() {
	        int menu = 0;
	        do {
	            try {
	                System.out.println();
	                System.out.println("**********************");
	                System.out.println("*****��ȭ ���� �ý���*****");
	                System.out.println("**********************");
	                System.out.println("1. �����ϱ�");
	                System.out.println();
	                System.out.println("2. ������ȸ");
	                System.out.println();
	                System.out.println("3. �������");
	                System.out.println();
	                menu = Integer.parseInt(sc.nextLine());
	                if (1 <= menu && menu <= 3) {
	                    return menu;
	                } else {
	                    throw new Exception("�޴� ���� ��ȣ�� �߸� �Ǿ����ϴ�");
	                }
	            } catch (Exception e) {
	                System.out.println(e.getMessage());
	                System.out.println("<�Է� ����>");
	                System.out.println("1~3���� �޴� �� �ϳ��� �����ϼ���");
	            }
	        } while (true);
	 
	    }
	 
	    // �¼����� �����ֱ�
	    void showseatArr() {
	        System.out.println();
	        System.out.println("*********�¼� ��Ȳ**********");
	        
	        
	        for (int i = 0; i < seatArr.length; i++) {
	            for (int j = 0; j < seatArr[i].length; j++) {
	                System.out.printf("[%s]", reservationNumberArr[i][j] == 0 ? (i + 1) + "-" + (j + 1) : "����");
	            }
	            System.out.println();
	 
	        }System.out.println("-------------------------");
	    }
	    
	    //�����ϱ�
	    void reservation() {
	        int row = 0;
	        int col = 0;
	        String inputseatArrNumber;   //����ڿ��� �¼���ȣ�� �Է¹޴� ����
	 
	        outer: while (true) {
	            // �¼� �����ϱ�
	            while (true) {
	                
	                //����ó��
	                outer2: do {
	                    try {
	                        showseatArr();
	                        System.out.println("�¼��� �������ּ���. ��)1-1");
	                        System.out.println("�̹� ���ŵ� �¼��� \"����\"��� ǥ�õ˴ϴ�.");
	                        inputseatArrNumber = sc.nextLine();
	                        String[] inputArray = inputseatArrNumber.split("-");  //�Է¹��� �¼����� ���ø����� �߶� �迭�� �����
	                        row = (Integer.parseInt(inputArray[0])) - 1;        //�迭 index���� 0���� �����ϹǷ� �Է¹��� �¼���ȣ���� 1�� ���ش�
	                        col = (Integer.parseInt(inputArray[1])) - 1;
	                        //������ for�� ���
	                        for(String[] arr : seatArr) {
	                            for(String str : arr) {
	                                if (str.contentEquals(inputseatArrNumber)) {  //����� �Է� �¼���ȣ�� ��ġ�ϴ� �¼��� ������ ����ó���� ���� do while�� Ż��
	                                    break outer2;
	                                } else if (str.contentEquals("����")) {    //������ ��쵵 ����ó���� ���� do while�� Ż��
	                                    break outer2;
	                                }
	                            }
	                        }    
	                        //�Ϲ� for�� ���
//	                        for (int i = 0; i < seatArr.length; i++) {
//	                            for (int j = 0; j < seatArr[i].length; j++) {
//	                                if (seatArr[i][j].contentEquals(inputseatArrNumber)) {  //����� �Է� �¼���ȣ�� ��ġ�ϴ� �¼��� ������ ����ó���� ���� do while�� Ż��
//	                                    break outer2;
//	                                } else if (seatArr[i][j].contentEquals("����")) {    //������ ��쵵 ����ó���� ���� do while�� Ż��
//	                                    break outer2;
//	                                }
	//
//	                            }
//	                        }
	                        throw new Exception("<�Է� ������ ���� �ʰ�>");
	 
	                    } catch (Exception e) {
	                        System.out.println(e.getMessage());
	                        System.out.println("�¼� �Է� ������ �߸��Ǿ����ϴ�. �ٽ� �Է����ּ���.");
	                        System.out.println();
	                    }
	                } while (true);
	                
	            
	                //����ó���� ��������� ��û�� ���� ���� ����
	                if (!seatArr[row][col].contentEquals("����")) {     // �¼��� ���ŵ� �¼����� �ƴ��� �˻�
	                    System.out.println("���� �����մϴ�. �����Ͻðڽ��ϱ�?");
	                    //���� ���࿡ ���� ����ó��
	                    outer3: do {
	                        System.out.println("��(1), �ƴϿ�(2), �ʱ�ȭ��(0)�� �ϳ��� �Է����ּ���.");
	                        
	                        try {
	                            int choice = 0;
	                            choice = Integer.parseInt(sc.nextLine());
	                            if (choice == 1 || choice == 2 || choice == 0) {    // 1, 2, 0 �̿��� �Է��� ����ó�� ���ش�
	                                if (choice == 1) {
	                                    seatArr[row][col] = "����";
	                                    int hash = (int) ((Math.random() * 90000000) + 10000000);  //�� 8�ڸ� ���Ź�ȣ�� ���� ����
	                                    for (int i = 0; i < seatArr.length; i++) {
	                                        for (int j = 0; j < seatArr[i].length; j++) {        // ���Ź�ȣ �ߺ� ����
	                                            if (reservationNumberArr[i][j] == hash) {
	                                                hash = (int) ((Math.random() * 90000000) + 10000000);
	                                                i = -1;
	                                                break;
	                                            }
	                                        }
	                                    }
	                                    reservationNumberArr[row][col] = hash;
	                                    System.out.println();
	                                    System.out.printf("���Ű� �Ϸ�Ǿ����ϴ�.\n������ �¼���ȣ:[%s]/ ���Ź�ȣ:[%s]\n�����մϴ�.\n",
	                                            inputseatArrNumber, reservationNumberArr[row][col]);
	                                    break outer;
	                                } else if (choice == 0) {
	                                    break outer;
	                                } else {
	                                    break outer3;
	                                }
	                            } else
	                                throw new Exception("<�Է� ���� �ʰ�>");
	 
	                        } catch (Exception e) {
	                            System.out.println(e.getMessage());
	                            System.out.println("�߸� �Է��Ͽ����ϴ�. �ٽ� �Է��� �ּ���.");
	 
	                        }
	                    } while (true);
	 
	                } else {                                        //���ŵ� �¼��� ���
	                    System.out.println();
	                    System.out.println("�̹� ���ŵ� �¼��Դϴ�");
	                }
	            }
	        }
	    }
	    
	    //���� ��ȸ
	    boolean reservationInquiry() {
	        //����ó��
	        do {
	            try {
	                System.out.println("���Ź�ȣ�� �Է����ּ���.");
	                reservationNumber = sc.nextLine();
	                if (reservationNumber.contentEquals("")) {
	                    System.out.println("�߸� �Է��ϼ̽��ϴ�.");
	                } else {
	                    for (int i = 0; i < seatArr.length; i++) {
	                        for (int j = 0; j < seatArr[i].length; j++) {
	                            if (reservationNumberArr[i][j] == Integer.parseInt(reservationNumber)) {
	                                System.out.println();
	                                //���ŵ� �¼��� �̹� "����"�� �ԷµǾ� �����Ƿ� i,j�� Ȱ���ؼ� �����¼��� �˷��ش�
	                                System.out.printf("������ �����Ͻ� �¼��� %s�Դϴ�.\n\n", (i + 1) + "-" + (j + 1));
	                                return true;
	                            }
	                        }
	                    }
	                    System.out.println();
	                    System.out.println("��ġ�ϴ� ���Ź�ȣ�� �����ϴ�.");
	                    return false;
	                }
	            } catch (Exception e) {
	                System.out.println(e.getMessage());
	                System.out.println("�߸� �Է��Ͽ����ϴ�. �ٽ� �Է��� �ּ���.");
	            }
	        } while (true);
	    }
	    
	    //���� ���
	    void canclation() {
	        if (reservationInquiry()) {
	            System.out.println("���Ÿ� ����Ͻðڽ��ϱ�?");
	            //����ó��
	            outer: do {
	                System.out.println("��(1), �ƴϿ�(2)�� �ϳ��� �Է����ּ���.");
	 
	                int choice = 0;
	                choice = Integer.parseInt(sc.nextLine());
	                try {
	                    if (choice == 1 || choice == 2) {
	                        if (choice == 1) {
	 
	                            outer2: for (int i = 0; i < seatArr.length; i++) {
	                                for (int j = 0; j < seatArr[i].length; j++) {
	                                    if (reservationNumberArr[i][j] == Integer.parseInt(reservationNumber)) {
	                                        reservationNumberArr[i][j] = 0;             //�¼��� ���Ź�ȣ�� �ʱ�ȭ
	                                        seatArr[i][j] = (i + 1) + "-" + (j + 1);       //�¼��� �̸��� �ʱ�ȭ
	                                        break outer2;
	                                    }
	                                }
	                            }
	                            System.out.printf("���Ű� ��ҵǾ����ϴ�. �����մϴ�.\n\n");
	                            break;
	                        } else {
	                            break outer;
	                        }
	                    } else
	                        throw new Exception("<�Է� ���� �ʰ�>");
	                } catch (Exception e) {
	                    System.out.println(e.getMessage());
	                    System.out.println("�߸� �Է��Ͽ����ϴ�. �ٽ� �Է��� �ּ���.");
	                    System.out.println();
	                }
	            } while (true);
	        }
	    }
	 
	    
	    public static void main(String[] args) {
	 
	        Cinema cinema = new Cinema(4, 5);   //�����ε� �����ڸ� �̿��� ��ȭ�� �¼��� Ŀ������ �� �ִ�
	 
	        while (true) {
	            switch (cinema.displayMenu()) {
	            case 1: {
	                cinema.reservation();
	                break;
	            }
	            case 2: {
	                cinema.reservationInquiry();
	                break;
	            }
	            case 3: {
	                cinema.canclation();
	                break;
	            }
	 
	            }
	 
	        }
	 
	    }
}
