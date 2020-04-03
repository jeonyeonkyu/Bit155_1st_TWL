package HomeWork_Bank.Team_1;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

class Bank {
	private ArrayList<Account> accounts;
	private int totalAccount;

	Bank() {
		accounts = new ArrayList<Account>();
	}

	public void addAccount(String accountNo, String name) {
		accounts.add(new Account(accountNo, name));
		totalAccount++;
	}

	public Account getAccount(String accountNo) {
		System.out.println(" = �ش� ���¹�ȣ�� �������� = ");
		for (Account tmp : accounts) {
			if (tmp.accountNo.equals(accountNo)) {

				System.out.println(tmp.toString());
				System.out.println();
				return tmp;
			}
		}
		return null;
	}

	public Account[] findAccount(String name) {
		// Account[] >> List<Account>
		ArrayList<Account> sameNameacc = new ArrayList<Account>();
		System.out.println();
		System.out.println(" = �ش� �����ڸ��� ���� ��� =");
		for (Account tmp : accounts) {
			if (tmp.name.equals(name)) {
				sameNameacc.add(tmp);
			}
		}

		Iterator<Account> it = sameNameacc.iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}
		System.out.println();

		Account[] sNamearr = new Account[sameNameacc.size()];
		int index = 0;
		for (Account tmp : sameNameacc) {
			sNamearr[index++] = tmp;
		}
		return sNamearr;
	}

	public ArrayList getAccounts() {
		// ArrayList >> ArrayList<Account>
		System.out.println(" = ��ü ���� ��� = ");
		Iterator<Account> it = accounts.iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}
		System.out.println();

		return accounts;

	}

	public int getTotalAccount() {
		System.out.println("��ü ���� �� : " + totalAccount);
		System.out.println();
		return totalAccount;
	}
}

class Account {
	String accountNo;
	String name;
	long balance;
	ArrayList<Transaction> transactions;

	Account(String accountNo, String name) {
		this.accountNo = accountNo;
		this.name = name;
		transactions = new ArrayList<Transaction>();
	}

	public void deposit(long amount) {
		this.balance += amount;
		System.out.printf("%d�� �Ա��ϼ̽��ϴ�.\n���� �ܾ��� %d�� �Դϴ�.\n", amount, balance);
		System.out.println();
		transactions.add(new Transaction(amount, balance));

	}

	public void withdraw(long amount) {
		this.balance -= amount;
		System.out.printf("%d�� �����ϼ̽��ϴ�.\n���� �ܾ��� %d�� �Դϴ�.\n", amount, balance);
		System.out.println();
		transactions.add(new Transaction(amount, balance));
	}

	public long getBalance() {
		System.out.println("���� �ܾ��� " + balance + "�� �Դϴ�.");
		return balance;
	}

	public ArrayList getTransactions() {
		// ArrayList<Transaction> 
		System.out.println(" = �ŷ� ���� = ");
		Iterator<Transaction> it = transactions.iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}
		System.out.println();

		return transactions;
	}

	@Override
	public String toString() {
		return "[���¹�ȣ :" + accountNo + ", ������ �� : " + name + ", �ܾ� : " + balance + "]";
	}
}

class Transaction {
	String transactionDatenTime;
	long amount;
	long balance;

	Transaction(long amount, long balance) {
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy��MM��dd��HH��mm��");
		transactionDatenTime = ft.format(date);
		this.amount = amount;
		this.balance = balance;

	}

	@Override
	public String toString() {
		return "[" + "�ŷ��ݾ�:" + amount + ", �ܾ�:" + balance + "�� /" + transactionDatenTime + "]";
	}
}

public class Collection_Exam {

	public static void main(String[] args) {
		Bank sh = new Bank();
		sh.addAccount("10071", "��"); // ���� ����
		sh.addAccount("890113", "��");
		sh.addAccount("0113", "��");
		sh.addAccount("987654321", "����");

		sh.getTotalAccount(); // ��ü ���� ��
		sh.getAccounts(); // ���¸�� ��ȸ
		sh.getAccount("890113").deposit(200000); // �Ա�
		sh.getAccount("890113").deposit(200000); // �Ա�
		sh.getAccount("890113"); // ���¹�ȣ�� ���� ��ȸ
		sh.findAccount("��"); // �������� ���¸��
		sh.getAccount("123456789"); // �������� �ʴ� ���¹�ȣ�� ã�� ���
		sh.findAccount("����"); // �������� �ʴ� �����ڸ����� ã�� ���
		sh.getAccount("890113").withdraw(5500); // ���
		sh.getAccount("890113").getTransactions(); // �ŷ����� ��ȸ

	}

}
