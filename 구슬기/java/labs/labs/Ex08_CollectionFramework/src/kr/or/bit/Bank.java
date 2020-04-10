package kr.or.bit;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Bank {
	
	private ArrayList<Account> accounts; // 계좌(0개 이상)
	private int totalAccount = 0; // 총 계좌 수
	public Bank(){
		accounts = new ArrayList<Account>();
	}
	public ArrayList<Account> getAccounts1() { //accounts 멤버필드에 접근
		return accounts;
	}
	public void addAccount(String accountNo, String name) { //계좌 생성	
			accounts.add(new Account(accountNo, name));
			totalAccount++;	
	}
	public Account getAccount(String accountNo) { // 계좌번호로 계좌 찾기... <계좌가 있다: 계좌번호 반환> 이런 식인 듯
		Account a = null;
		for (int i = 0; i < accounts.size(); i++) {
			if (accounts.get(i).getAccountNo().equals(accountNo)) {
				System.out.println("당신의 계좌: " + accountNo );
				a = accounts.get(i); // 해당계좌의 주소값반환
				break;
			} else {
				System.out.println("해당 계좌는 은행에 존재하지 않습니다");
				break;
			}
		}
		return a;
	}
	public ArrayList<Account> findAccounts(String name) { // 이름으로 계좌번호 찾기
		for (int i = 0; i < accounts.size(); i++) {
			if (accounts.get(i).getName().equals(name)) {
				System.out.println("해당이름의 계좌번호는:"+accounts.get(i).getAccountNo());
				break;
			} else {
				System.out.println("해당이름으로 계좌번호를 찾을수없습니다....");
				break;
			}
		}
		return accounts;
	}
	public ArrayList getAccounts() { // 모든 계좌 목록 보기
		if (!accounts.isEmpty()) {
			for(Account a : accounts) { //계좌의 개수만큼 for문을 돌림 
				System.out.println(a.getAccountNo()+","+a.getName());
			}
		} else {
			System.out.println("계좌가 없습니다.");
		}
		return accounts;
	}
	public int getTotalAccount() { // 총 계좌 수 반환
		return totalAccount;
	}
}