package kr.or.bit;

import java.util.ArrayList;

public class Account {
	private String accountNo; // 계좌번호
	private String name; // 소유자명
	private long balance; // 잔고
	ArrayList<Transaction> li = new ArrayList<Transaction>(); //거래내역 (0개이상)
	
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
	public void deposit(long amount) { // 입금 기능
		if (amount <= 0) {
			System.out.println("금액을 정확히 입력하세요.");
			return;
		}
		this.balance += amount;
	}
	public void withdraw(long amount) { // 출금 기능
		if (this.balance < amount) {
			System.out.println("잔액이 부족합니다.");
			return;
		}
		this.balance -= amount;
		System.out.println("출금 완료: " + amount);
	}
	public long getBalance() { // 잔고 확인 기능
		System.out.println("잔고: "+ balance);
		return balance;
	}
}
