package HomeWork_Bank.Team_4;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
 
public class Account {
    private String accountNo; // ���¹�ȣ
    private String name; // �����ڸ�
    private long balance; // �ܰ�
    private ArrayList<Transaction> transactions = new ArrayList<>(); // �ŷ�����
 
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
 
    public long getBalance() {
        return balance;
    }
 
    public void setBalance(long balance) {
        this.balance = balance;
    }
 
    public ArrayList<Transaction> getTransactions() {
        return transactions;
    }
 
    public void setTransactions(ArrayList<Transaction> transactions) {
        this.transactions = transactions;
    }
 
    public void deposit(long amount) {
        this.balance += amount;
        Transaction trans = new Transaction();
        trans.setAmount(amount);
        trans.setKind("�Ա�");
        trans.setBalance(this.balance);
        transactions.add(trans);
        Date from = new Date();
        SimpleDateFormat sdt = new SimpleDateFormat("yyyy��MM��dd��");
        SimpleDateFormat sdt2 = new SimpleDateFormat("hh��mm��ss��");
        trans.setTransactionDate(sdt.format(from) + sdt2.format(from));
 
    }
 
    public void withdraw(long amount) {
        this.balance -= amount;
        Transaction trans = new Transaction();
        trans.setAmount(amount * -1);
        trans.setKind("���");
        trans.setBalance(this.balance);
        transactions.add(trans);
        Date from = new Date();
        SimpleDateFormat sdt = new SimpleDateFormat("yyyy��MM��dd��");
        SimpleDateFormat sdt2 = new SimpleDateFormat("hh��mm��ss��");
        trans.setTransactionDate(sdt.format(from) + sdt2.format(from));
    }
 
    @Override
    public String toString() {
        return "Account [accountNo=" + accountNo + ", name=" + name + ", balance=" + balance + ", transactions="
                + transactions + "]";
    }
 
}
