package kr.or.bit;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Bank {
	
	private ArrayList<Account> accounts; // ����(0�� �̻�)
	private int totalAccount = 0; // �� ���� ��
	public Bank(){
		accounts = new ArrayList<Account>();
	}
	public ArrayList<Account> getAccounts1() { //accounts ����ʵ忡 ����
		return accounts;
	}
	public void addAccount(String accountNo, String name) { //���� ����	
			accounts.add(new Account(accountNo, name));
			totalAccount++;	
	}
	public Account getAccount(String accountNo) { // ���¹�ȣ�� ���� ã��... <���°� �ִ�: ���¹�ȣ ��ȯ> �̷� ���� ��
		Account a = null;
		for (int i = 0; i < accounts.size(); i++) {
			if (accounts.get(i).getAccountNo().equals(accountNo)) {
				System.out.println("����� ����: " + accountNo );
				a = accounts.get(i); // �ش������ �ּҰ���ȯ
				break;
			} else {
				System.out.println("�ش� ���´� ���࿡ �������� �ʽ��ϴ�");
				break;
			}
		}
		return a;
	}
	public ArrayList<Account> findAccounts(String name) { // �̸����� ���¹�ȣ ã��
		for (int i = 0; i < accounts.size(); i++) {
			if (accounts.get(i).getName().equals(name)) {
				System.out.println("�ش��̸��� ���¹�ȣ��:"+accounts.get(i).getAccountNo());
				break;
			} else {
				System.out.println("�ش��̸����� ���¹�ȣ�� ã���������ϴ�....");
				break;
			}
		}
		return accounts;
	}
	public ArrayList getAccounts() { // ��� ���� ��� ����
		if (!accounts.isEmpty()) {
			for(Account a : accounts) { //������ ������ŭ for���� ���� 
				System.out.println(a.getAccountNo()+","+a.getName());
			}
		} else {
			System.out.println("���°� �����ϴ�.");
		}
		return accounts;
	}
	public int getTotalAccount() { // �� ���� �� ��ȯ
		return totalAccount;
	}
}