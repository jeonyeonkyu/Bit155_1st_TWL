package HomeWork_Bank.Team_2;

import java.util.List;

public class Program {

	public static void main(String[] args) {
		     Bank bank = new Bank();
	        // ���� ����
	        bank.addAccount("1111", "������");
	        bank.addAccount("2222", "������");
	        bank.addAccount("3333", "������");
	 
	        
	        try {
	            // ���¹�ȣ or �����ڸ����� ���¸� ã�´�.
	            System.out.println("1111��� ���¹�ȣ�� ���� ����� ����");
	            System.out.println(bank.getAccount("1111").toString());
	            // aaa��� �̸��� ���� ���¸� ã�´�.
	            System.out.println("������ �̶�� �̸��� ���� ����� ����");
	            System.out.println(bank.findAccounts("������").toString());
	        } catch (NullPointerException npe) {
	            System.out.println("ã�� ���°� �����ϴ�.");
	        }
	        System.out.println();
	        System.out.println("��ü ���� ���");
	        bank.getTotalAccounts();
	 
	        // ���� Ŭ���� ����� �Ա�,���,�ܰ�Ȯ��,�ŷ������� �ٷ�� ���� ���� get
	        List<Account> list = bank.getAccounts();
	        for (Account ac : list) {
	            if (ac.getAccountNo() == "1111") { //
	                System.out.println(list.get(0).getName());
	                list.get(0).deposit(1000);
	                list.get(0).deposit(2000);
	                list.get(0).deposit(3000);
	                System.out.println(list.get(0).getBalance());
	                list.get(0).withdraw(3000);
	                System.out.println(list.get(0).getBalance());
	                System.out.println(bank.getAccount("1111").toString());
	                System.out.println();
	                list.get(0).getTransactions(); // Ʈ����� ��ü����
	            }
	        }
	 

	}

}
