package HomeWork_Bank.Team_3;

import java.util.ArrayList;

public class Account {
	private String accountNo; // ���¹�ȣ
	private String name; // �����ڸ�
	private long balance; // �ܰ�
	private ArrayList<Transaction> transactions; // �ŷ�����

	Account(String accountNo, String name) {
		this.accountNo = accountNo;
		this.name = name;
		this.balance = 0;
		this.transactions = new ArrayList<Transaction>();

	}

	public String getAccountNo() {
		return this.accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Account [���¹�ȣ=" + accountNo + ", �����ڸ�=" + name + ", �ܰ�=" + balance + "]";
	}

	public void deposit(long amount) { // �Ա��Ѵ�
		this.balance += amount;
		System.out.printf("[%s]���¿� [%d]���� �Ա�. ���� �ܰ�: %d\n", accountNo, amount, balance);
		this.transactions.add(new Transaction("�Ա�", amount, balance));
	}

	public void withdraw(long amount) { // ����Ѵ�
		this.balance -= amount;
		System.out.printf("[%s]���¿� [%d��]�� ���. ���� �ܰ�: %d\n", accountNo, amount, balance);
		this.transactions.add(new Transaction("�Ա�", amount, balance));
	}

	public long getBalance() { // �ܰ� Ȯ���Ѵ�
		System.out.printf("%s���� �ܰ� Ȯ��. ���� �ܰ�: %d\n", accountNo, balance);
		return balance;
	}

	public ArrayList<Transaction> getTransactions() { // �ŷ������� Ȯ���Ѵ�
		System.out.println("***�ŷ� ����***");
		for (Transaction tr : transactions) {
			System.out.println(tr.toString());
		}
		return transactions;
	}

}