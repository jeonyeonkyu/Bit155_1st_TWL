package HomeWork_Bank.Team_4;

import java.util.ArrayList;

public class Bank {
    private ArrayList<Account> accounts = new ArrayList<>(); // ����
    private int totalAccount; // �Ѱ��¼�
 
    public ArrayList<Account> getAccounts() {
        return accounts;
    }
 
    public void setAccounts(ArrayList<Account> accounts) {
        this.accounts = accounts;
    }
 
    public int getTotalAccount() {
        return totalAccount;
    }
 
    public void setTotalAccount(int totalAccount) {
        this.totalAccount = totalAccount;
    }
 
    public void addAccount(String accountNo, String name) {
        Account account = new Account();
        account.setAccountNo(accountNo);
        account.setName(name);
        accounts.add(account);
        totalAccount++;
    }
 
    public Account getAccount(String accountNo) {
        for (Account account : accounts) {
            if (account.getAccountNo().equals(accountNo)) {
                return account;
            }
        }
        return null;
    }
 
    public ArrayList<Account> findAccounts(String name) {
        ArrayList<Account> findAccs = new ArrayList<>();
        for (Account account : accounts) {
            if (account.getName().equals(name)) {
                findAccs.add(account);
            }
        }
        return findAccs;
    }
}
 