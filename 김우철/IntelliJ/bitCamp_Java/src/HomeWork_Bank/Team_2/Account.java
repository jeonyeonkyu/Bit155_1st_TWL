package HomeWork_Bank.Team_2;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class Account {
	 private String accountNo;
	    private String name;
	    private long balance;
	    private List<Transaction> transactions = new ArrayList();
	    
	    
	    //������ Ŭ������ ....
	    Date today = new Date();
	    SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
	    SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss a");
	 
	    
	 
	    // �߰�
	    Account(String accountNo, String name) {
	        this.accountNo = accountNo;
	        this.name = name;
	    }
	 
	    public void deposit(long amount) { //�Ա�
	        balance += amount;
	        transactions.add(new Transaction(date.format(today),time.format(today),"�Ա�",amount,balance));
	    }
	 
	    public void withdraw(long amount) { //���
	        balance -= amount;
	        transactions.add(new Transaction(date.format(today),time.format(today),"���",amount,balance));
	    }
	 
	    public long getBalance() {
	        return balance;
	    }
	 
//	    public List<Transaction> getTransactions() {
//	        return transactions;
//	    }
	    
	    public void getTransactions() { // ��üƮ����� ��� ��ȸ ������
	        Iterator ia = this.transactions.iterator();
	        while (ia.hasNext()) {
	            System.out.println(ia.next());
	        }
	    }
	 
	    // -----------------------------
	 
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
	 
	    public void setTransactions(List<Transaction> transactions) {
	        this.transactions = transactions;
	    }
	 
	    @Override
	    public String toString() {
	        return "Account [accountNo=" + accountNo + ", name=" + name + ", balance=" + balance + ", transactions="
	                + transactions + "]";
	    }
}
