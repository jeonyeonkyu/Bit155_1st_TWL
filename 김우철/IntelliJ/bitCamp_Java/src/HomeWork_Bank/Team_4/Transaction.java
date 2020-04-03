package HomeWork_Bank.Team_4;

public class Transaction {
    private String transactionDate = ""; // �ŷ���
    private String transactionTime = ""; // �ŷ��ð�
    private String kind; // �Ա� �Ǵ� ���
    private long amount; // �ŷ��ݾ�
    private long balance; // �ܰ�
 
    
    public String getTransactionDate() {
        return transactionDate;
    }
 
    public void setTransactionDate(String transactionDate) {
        this.transactionDate = transactionDate;
    }
 
    public String getTransactionTime() {
        return transactionTime;
    }
 
    public void setTransactionTime(String transactionTime) {
        this.transactionTime = transactionTime;
    }
 
    public String getKind() {
        return kind+transactionDate+transactionTime;
        
    }
 
    public void setKind(String kind) {
        this.kind = kind;
    }
 
    public long getAmount() {
        return amount;
    }
 
    public void setAmount(long amount) {
        this.amount = amount;
    }
 
    public long getBalance() {
        return balance;
    }
 
    public void setBalance(long balance) {
        this.balance = balance;
    }
 
    @Override
    public String toString() {
        return "Transaction [kind=" + kind + ", amount=" + amount + ", balance=" + balance + "]";
    }
 
}
 