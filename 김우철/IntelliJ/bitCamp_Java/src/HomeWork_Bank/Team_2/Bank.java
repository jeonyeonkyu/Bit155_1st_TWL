package HomeWork_Bank.Team_2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Bank {
	private List<Account> accounts;
	private int totalAccount;

	Bank() {
		accounts = new ArrayList();
		totalAccount = 0;
	}

	public void addAccount(String accountNo, String name) {
		this.accounts.add(new Account(accountNo, name));
		totalAccount++;
	}

	public Account getAccount(String accountNo) {
		//������ �ѹ��� ����ϼ��� ^^
		
		for (Account account : accounts) {
			if (account.getAccountNo().equals(accountNo)) {
				return account;
			}
		}
		// �Ű������� ���� accountNo���� ���� �� ��ȯ�� ��
		return null;

	}

	public List<Account> findAccounts(String name) { // ã�� �̸��� ������ ����
		List<Account> ac = new ArrayList();
		for (Account account : accounts) {
			if (account.getName().equals(name)) {
				ac.add(account);
			}
		}
		return ac.size() == 0 ? null : ac;
	}

	public void getTotalAccounts() { // ��ü���¸�� ��ȸ ������
		Iterator ia = this.accounts.iterator();
		while (ia.hasNext()) {
			System.out.println(ia.next());
		}
	}

	public List<Account> getAccounts() {
		return this.accounts;
	}

	@Override
	public String toString() {
		return "Bank [accounts=" + accounts + ", totalAccount=" + totalAccount + "]";
	}
}
