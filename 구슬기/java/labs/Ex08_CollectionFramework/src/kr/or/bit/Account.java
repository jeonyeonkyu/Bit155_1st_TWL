package kr.or.bit;

import java.util.ArrayList;

public class Account {
	private String accountNo; // ���¹�ȣ
	private String name; // �����ڸ�
	private long balance; // �ܰ�
	ArrayList<Transaction> li = new ArrayList<Transaction>(); //�ŷ����� (0���̻�)
	
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setBalance(long balance) {
		this.balance = balance;
	}
	public Transaction getTransaction(Transaction t) {
		
		
		return t;
	}
	
	Account(String accountNo, String name) {
		this.accountNo = accountNo;
		this.name = name;
	}
	public void deposit(long amount) { // �Ա� ���
		if (amount <= 0) {
			System.out.println("�ݾ��� ��Ȯ�� �Է��ϼ���.");
			return;
		}
		this.balance += amount;
	}
	public void withdraw(long amount) { // ��� ���
		if (this.balance < amount) {
			System.out.println("�ܾ��� �����մϴ�.");
			return;
		}
		this.balance -= amount;
		System.out.println("��� �Ϸ�: " + amount);
	}
	public long getBalance() { // �ܰ� Ȯ�� ���
		System.out.println("�ܰ�: "+ balance);
		return balance;
	}
}
