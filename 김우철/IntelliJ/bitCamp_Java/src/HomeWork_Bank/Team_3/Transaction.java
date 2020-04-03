package HomeWork_Bank.Team_3;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Transaction {

	private String transactionDate;
	private String transactionTime;
	private String kind;
	private long amount;
	private long balance;

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

	public Transaction(String kind, long amount, long balance) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy��MM��dd��");
		SimpleDateFormat dateformat2 = new SimpleDateFormat("HH��mm��");
		this.transactionDate = dateformat.format(cal.getTime());
		this.transactionTime = dateformat2.format(cal.getTime());
		this.kind = kind;
		this.amount = amount;
		this.balance = balance;

	}

	@Override
	public String toString() {
		return "Transaction [�ŷ���=" + transactionDate + ", �ŷ��ð�=" + transactionTime + ", �ŷ�����=" + kind + ", �ŷ��ݾ�="
				+ amount + ", �ܰ�=" + balance + "]";
	}

}
